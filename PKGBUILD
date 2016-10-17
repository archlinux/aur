# Maintainer: renek <aur@spaceshore.net>
_pkgname=aiosasl
pkgname=python-${_pkgname}
pkgver=0.2
pkgrel=1
pkgdesc="A pure python generic asyncio SASL library"
arch=('any')
url="https://github.com/horazont/aiosasl"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('318d54304b6b9a58f7c4ff9443358307b651f28c1f5ac65778a6291ea7e08b2620aedba86354c15935daea30a69f77908780d3dd5db55c26debe605c52f6cef9')

check() {
    cd "$_pkgname-$pkgver"
    python -m nose
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
