# Maintainer: kevku <kevku@gmx.com>
pkgname=esteidfirefoxplugin
pkgver=3.12.1.1142
pkgrel=1
pkgdesc="Firefox ID card signing plugin."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('gtk2' 'esteidpkcs11loader')
makedepends=('cmake')
source=("https://installer.id.ee/media/ubuntu/pool/main/e/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('dd01cbfdf820999a2af1959113bf80dd5a8c19a597173672b900e41e7a2ae778')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/"
  make plugin
}

package() {
  cd "$srcdir/"
  install -D npesteid-firefox-plugin.so $pkgdir/usr/lib/mozilla/plugins/npesteid-firefox-plugin.so
}

