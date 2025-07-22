# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=easyeffects-record
pkgver=0.1.0
pkgrel=1
pkgdesc="Automated player and recorder for Easy Effects, allowing re-recording one or multiple songs with applied effects."
arch=('any')
url="https://github.com/mzivic7/$pkgname"
license=('GPL-3.0-only')
depends=('python>=3.11' 'easyeffects' 'ffmpeg' 'pipewire')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"
	install -Dm755 ./$pkgname.py "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
