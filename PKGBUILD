# Maintainer: <mumei AT airmail DOT cc>

_pkgname=FTP
pkgname=ftp.app
pkgrel=1
pkgver=0.6
pkgdesc='Compact GUI application for file and directory transfers'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.nongnu.org/gap/ftp/index.html'
license=('GPL2')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/FTP-0.6.tar.gz")
sha256sums=('f9884c1d0a3f37fea183ed1f80905d0f9ed3c99f776dc6a876434c7512c4d610')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
