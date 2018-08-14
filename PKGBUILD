# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

_pkgname=TextEdit
pkgname=textedit.app
pkgrel=2
pkgver=264
pkgdesc='GNUstep port of OS X 10.6 TextEdit'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/ericwa/TextEdit'
license=('BSD')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc')
source=("https://github.com/ericwa/TextEdit/archive/master.zip")
sha256sums=('13fb1df424d69eeb95f1ba8c6c9c4cfd039798dc5b01b20760d79d532a374b07')

build() {
  cd "TextEdit-master"
  make
}

package() {
  cd "TextEdit-master"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}