# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>
pkgname=python-globus-sdk
_pkgname=globus-sdk
pkgver=0.6.0
pkgrel=1
pkgdesc="This SDK provides a convenient Pythonic interface to Globus REST APIs, including the Transfer API and the Globus Auth API."
arch=(any)
url="https://github.com/globus/globus-sdk-python"
license=('Apache')
depends=('python' 'python-six' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b5699d08a9d3d7aa34f73c7b4c2582a0b99bbd67e5efc60a867f43983e0cc8e0')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    # don't install tests package
    sed -sie 's/find_packages()/find_packages(exclude=["tests.*", "tests"])/' setup.py
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

