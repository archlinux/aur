# Maintainer: renek <aur@spaceshore.net>
_pkgname=aiosasl
pkgname=python-${_pkgname}
pkgver=0.3.1
pkgrel=1
pkgdesc="A pure python generic asyncio SASL library"
arch=('any')
url="https://github.com/horazont/aiosasl"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ba5efbd38b0c8113b9dfa62d172259f79cc6a15071b3d85e22ba853cb19182b717c3e123babaf8aa43fe731293a25d71c0ef517d8e38a685691801d81a43e31f')

check() {
    cd "$_pkgname-$pkgver"
    python -m nose
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
