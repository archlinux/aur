# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Sebastian Wolf < fatmike303 at gmail dot com >
# Contributor: Guilherme Calé <gui@cabritacale.eu>

pkgname=fs-uae
pkgver=2.8.3
pkgrel=2
pkgdesc='An Amiga emulator based on UAE/WinUAE with a focus on emulating games'
arch=('i686' 'x86_64')
url='https://fs-uae.net/'
license=('GPL2')
depends=('sdl2' 'glib2' 'libpng' 'openal' 'libx11' 'libmpeg2' 'zlib'
         'shared-mime-info' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('freetype2' 'gettext' 'libxi' 'mesa' 'zip')
source=("https://fs-uae.net/stable/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e2d5414d07c8bd5b740716471183bc5516bec0ae2989449c3026374dc4b86292')

build() {
    cd "${pkgname}-${pkgver}"
    
    ./configure --prefix='/usr' --disable-jit
    
    make 
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
}
