# Maintainer: Joost Bremmer <toost dot b at gmail dot com>

pkgname=mackup
pkgver=0.8.15
pkgrel=4
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')
depends=('python')

makedepends=(
			'python'
			'python-docopt'
			'python-setuptools')

source=("https://github.com/lra/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('52eb2c8be8f3c615c6c158aa4e042db5172dec379f88b8108c5f4959f80ff0da'
            '752a2dbd06fb212f8632cc2ddbcc7e3d90c733093ad8a0f4c9615dc9b3926650')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/${pkgname}.patch"
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
