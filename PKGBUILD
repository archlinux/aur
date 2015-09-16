# Maintainer: kevku <kevku@gmx.com>
pkgname=esteidfirefoxplugin
pkgver=3.8.1.1116
pkgrel=1
pkgdesc="Firefox ID card signing plugin."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('gtk2' 'esteidpkcs11loader')
makedepends=('cmake')
conflicts=('esteid-browser-plugin-svn' 'sk-esteidfirefoxplugin-svn')
source=("https://installer.id.ee/media/ubuntu/pool/main/e/$pkgname/${pkgname}_$pkgver-ubuntu-13-10.tar.gz")
sha256sums=('b8c87404ad736d2172be31dc113d5d8bcc796ce76187997f4a4b76613f881f0f')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/$pkgname"
  make plugin
}

package() {
  cd "$srcdir/$pkgname"
  install -D npesteid-firefox-plugin.so $pkgdir/usr/lib/mozilla/plugins/npesteid-firefox-plugin.so
}

