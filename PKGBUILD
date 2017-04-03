# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>
pkgname=python-globus-sdk
_pkgname=globus-sdk
pkgver=0.7.1
pkgrel=1
pkgdesc="This SDK provides a convenient Pythonic interface to Globus REST APIs, including the Transfer API and the Globus Auth API."
arch=(any)
url="https://github.com/globus/globus-sdk-python"
license=('Apache')
depends=('python' 'python-six' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f6dbf39c19b48c7b4537b2bf831f2b5dd555b336e9ff760350bc66440cb85c56')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    # don't install tests package
    sed -sie 's/find_packages()/find_packages(exclude=["tests.*", "tests"])/' setup.py
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

