# Maintainer: Raziman Mahathir <raziman.mahathir@gmail.com>
pkgname=gomu
pkgver=1.6.1
pkgrel=2
pkgdesc="Terminal User Interface (TUI) Music Player"
arch=('x86_64')
url="https://github.com/issadarkthing/gomu"
license=('GPL')
groups=()
depends=('alsa-lib' 'youtube-dl')
makedepends=('go' 'git')
optdepends=('fzf')
conflicts=('gomu-git' 'gomu-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/issadarkthing/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7813c586bf974d93c5b395da2ecc3321')


build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./bin/gomu "$pkgdir/usr/bin/gomu"
}
