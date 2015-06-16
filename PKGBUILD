# Maintainer: kevku <kevku@gmx.com>
pkgname=esteidfirefoxplugin
pkgver=3.8.0.1115
pkgrel=1
pkgdesc="Firefox ID card signing plugin."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('gtk2' 'esteidpkcs11loader')
makedepends=('cmake')
conflicts=('esteid-browser-plugin-svn' 'sk-esteidfirefoxplugin-svn')
source=("https://installer.id.ee/media/sources/$pkgname-$pkgver.tar.gz"
	"https://installer.id.ee/media/sources/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('2783d275f08e3addc1e07990656220568477261367b56aa4737a89e14517afef'
            'SKIP')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make plugin
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D npesteid-firefox-plugin.so $pkgdir/usr/lib/mozilla/plugins/npesteid-firefox-plugin.so
}

