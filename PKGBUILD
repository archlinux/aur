# Maintainer: Frederick Price <fprice@pricemail.ca>
pkgname=lv2bm
pkgver=1.1
pkgrel=1
pkgdesc="Benchmark tool for LV2 plugins"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/mod-audio/lv2bm"
license=('GPL3')
depends=('glib2' 'lilv' 'libsndfile')
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mod-audio/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('eec990fcd228d5bab43e2ed2b0133a8e4da9994354a6f607baf213d58db5effe')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install PREFIX="${pkgdir}/usr"
}
