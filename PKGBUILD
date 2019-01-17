# Maintainer: Jeff M. Hubbard <jeffmhubbard@gmail.com>
_pkgname=playfetch
pkgname=${_pkgname}-git
pkgver=r16.1d0aa97
pkgrel=1
pkgdesc="Fetch playlists from GMusicProxy"
arch=('any')
url="https://github.com/jeffmhubbard/playfetch"
license=('MIT')
depends=('python' 'python-mpd2' 'python-requests')
makedepends=('git')
optdepends=('gmusicproxy: google play music proxy' 'mpd: play some playlists' 'mpnotd-git: display song info and album art')
conflicts=()
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp "$srcdir/$_pkgname/$_pkgname" $pkgdir/usr/bin/$_pkgname
}
