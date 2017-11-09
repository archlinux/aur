# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=drawio-batch
pkgver=7.6.7
pkgrel=1
pkgdesc="Command line converter for draw.io diagrams"
arch=(any)
url="https://github.com/languitar/drawio-batch"
license=('APACHE')
depends=('python' 'phantomjs')
makedepends=('git' 'python-setuptools' 'npm')
source=("https://github.com/languitar/drawio-batch/archive/${pkgver}.tar.gz")
md5sums=('84df4618ff8545e25ba91e4423daf0ec')

prepare() {
    npm install -g --prefix node_modules html-inline
}

package() {
    cd "${pkgname}-${pkgver}"
    PATH="../node_modules/bin:$PATH" ./prepare.sh
    python3 setup.py install --root="$pkgdir/"
}
