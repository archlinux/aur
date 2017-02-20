# Maintainer: Joost Bremmer <toost dot b at gmail dot com>

pkgname=mackup
pkgver=0.8.16
pkgrel=1
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
sha256sums=('d50a19be1c6a5b6a777ddfb4abbc6c76a361b3edce266f1618947ad38a100331'
            'ff7ccb9ce630718a4257743c4583cba46fe0864cdddbf3ac3bc9a3d2f39d8331')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/${pkgname}.patch"
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
