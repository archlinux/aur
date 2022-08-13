# Maintainer: Angel Sartonev <work@asart.bg>
pkgname=fwknop-gui
pkgver=1.3
pkgrel=2
pkgdesc='Official desktop client for the fwknop daemon'
url='https://incomsystems.biz/fwknop-gui/'
license=('GPL3')
arch=('i686' 'x86_64')
depends=(fwknop wxwidgets qrencode)
provides=(fwknop-gui)
conflicts=(fwknop-gui)
makedepends=(cmake asciidoc)
optdepends=()
source=(https://github.com/jp-bennett/fwknop-gui/archive/refs/tags/v${pkgver}-release.tar.gz)

md5sums=('2a6312cde3d80cbdbb2d5960dcb51b12')
build() { 
	cmake \
            -B "${srcdir}/${pkgname}-${pkgver}-release" \
            -S "${srcdir}/${pkgname}-${pkgver}-release" \
            -DCMAKE_INSTALL_PREFIX:PATH='/usr'
	make -C "${srcdir}/${pkgname}-${pkgver}-release"
}
package() {
        make -C "${srcdir}/${pkgname}-${pkgver}-release" DESTDIR="${pkgdir}" install
}

