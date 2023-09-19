# Maintainer: Léo <waste at mrtino dot eu>

pkgname=badwolf
pkgver=1.3.0
pkgrel=1
pkgdesc="A minimalist and privacy-oriented WebKitGTK+ browser."
url="https://hacktivis.me/projects/badwolf"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('BSD')
makedepends=('ninja' 'ed')
depends=('webkit2gtk' 'libxml2')
source=("https://hacktivis.me/releases/$pkgname-$pkgver.tar.gz")
sha512sums=('f83884f9a1c4d12d641f68697d7fab7885803975ead6cb78e88b0b8d2f7b6f9da116f72e39f02c47e8dca89e4ced9b932524338a6211c7d4509c12206c10cdeb')
changelog=changelog

build() {
  cd "$pkgname-$pkgver"
  PREFIX=/usr ./configure
  ninja
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
  DESTDIR="${pkgdir}/" ninja install
}
