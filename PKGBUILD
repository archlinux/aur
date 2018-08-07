# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>
pkgname=python-globus-sdk
_pkgname=globus-sdk
pkgver=1.5.0
pkgrel=2
pkgdesc="This SDK provides a convenient Pythonic interface to Globus REST APIs, including the Transfer API and the Globus Auth API."
arch=(any)
url="https://github.com/globus/globus-sdk-python"
license=('Apache')
depends=('python' 'python-six' 'python-requests' 'python-pyjwt')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f3ee8294c11f0d1a4430ae7534236c6a6837312f1b4056adbb183a3af663d2be')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    # don't install tests package
    sed -sie 's/find_packages()/find_packages(exclude=["tests.*", "tests"])/' setup.py
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

