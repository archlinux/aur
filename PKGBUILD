# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=libtimidity
pkgver=0.2.8
pkgrel=1
pkgdesc="a MIDI to WAVE converter library based on the TiMidity decoder from SDL_sound library"
arch=('i686' 'x86_64' 'aarch64')
url="https://libtimidity.sourceforge.net/"
license=('LGPL-2.0-only')
depends=('glibc')
#source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4700e23b55f6eb012c98022bfdf4ccaf298215c96e988e729add9c9c8945852a')

build() {
   cd $srcdir/$pkgname-$pkgver
   ./configure --prefix=/usr
   make
}

package() {
   cd $srcdir/$pkgname-$pkgver
   make DESTDIR="${pkgdir}" install
}
