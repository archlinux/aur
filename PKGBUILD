# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
_basename=untrunc
pkgname=untrunc-anthwlock-cli-git
pkgver=r364.bd783dd
pkgrel=1
pkgdesc="Restore a truncated mp4/mov. Improved version of ponchio/untrunc. CLI only."
arch=('x86_64')
url="https://github.com/anthwlock/untrunc"
license=('GPL-2.0-only')
groups=()
depends=('ffmpeg')
makedepends=('git')
provides=("$_basename-git")
conflicts=("$_basename-git")
replaces=("$_basename-git")
backup=()
options=()
install=
source=('untrunc::git+https://github.com/anthwlock/untrunc')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_basename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_basename}"
	make
}

package() {
	cd "$srcdir/${_basename}"
	install -Dm755 untrunc "$pkgdir/usr/bin/untrunc"
}
