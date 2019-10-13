# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# ^source?      ^taken?                     ^wat
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Henrique C. Alves <hcarvalhoalves@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=matchbox-window-manager-git
pkgver=1.2
pkgrel=4
pkgdesc="A pretty much unique X window manager with a classic PDA management policy"
arch=('any')
license=('GPL')
depends=('libmatchbox' 'startup-notification' 'gconf' 'libpng' 'libsm')
url="http://matchbox-project.org/"
source=('matchbox-window-manager::git+https://git.yoctoproject.org/git/matchbox-window-manager.git')

sha256sums=('SKIP')

build() {
#  cd "$srcdir"/$pkgname-$pkgver
   cd "matchbox-window-manager"
   ./autogen.sh
   ./configure --sysconfdir=/etc --prefix=/usr \
      --enable-startup-notification --enable-session \
      --enable-alt-input-wins --enable-expat
  make
}

package() {
  cd "matchbox-window-manager"
  make DESTDIR="$pkgdir" install
}
