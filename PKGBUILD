# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=libtimidity
pkgver=0.2.7
pkgrel=1
pkgdesc="a MIDI to WAVE converter library based on the TiMidity decoder from SDL_sound library"
arch=('i686' 'x86_64' 'aarch64')
url="https://libtimidity.sourceforge.net/"
license=('LGPL-2.0-only')
depends=('glibc')
#makedepends=('git')
#source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('26447cbc049fb262e26b640e42c063e8694133aa92ff145e0d0b15a03a352e6a')

build() {
   cd $srcdir/$pkgname-$pkgver
   ./configure --prefix=/usr
   make
}

package() {
   cd $srcdir/$pkgname-$pkgver
   make DESTDIR="${pkgdir}" install
}
