# Maintainer: Raziman Mahathir <raziman.mahathir@gmail.com>
pkgname='gomu'
pkgver=v1.5.5
pkgrel=2
pkgdesc="Terminal User Interface (TUI) Music Player"
arch=('x86_64')
url="https://github.com/issadarkthing/gomu"
license=('GPL')
groups=()
depends=('alsa-lib' 'youtube-dl' 'noto-fonts-emoji')
makedepends=('go' 'git')
optdepends=('fzf')
conflicts=('gomu-git' 'gomu-bin')
source=("git://github.com/issadarkthing/gomu.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make build
}

package() {
	cd "$pkgname"
	install -Dm755 ./bin/gomu "$pkgdir/usr/bin/gomu"
}
