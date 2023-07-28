# Maintainer: szdytom <szdytom@qq.com>
pkgname="cchv2"
_pkgname="CCHv2"
pkgver="2.0.40"
_pkgver="2.0-beta-40"
pkgrel=2
pkgdesc="A powerful contest helper for CodeForces.com"
arch=("any")
url="https://github.com/CodeforcesContestHelper/CCHv2"
license=('GPL3')
groups=()
depends=("nwjs-bin")
provides=("CCHv2")
source=("CCHv2.sh"
	"CCHv2.desktop"
	"https://github.com/CodeforcesContestHelper/$_pkgname/archive/refs/tags/v$_pkgver.zip")
noextract=("CCHv2.desktop")
sha256sums=(
	"c0e4ffb027ea4b1f65cfe2b6588925b7b659f628ce546fbc7b2bd3b5932045f5"
	"a131b262e4c91f0ff12a8b9ddf040763e2a81520bf05b1b3dd943497e1ccad60"
	"db09027cf609691a0f8ca04321ce6d0d1fd5a0af0392663a01407b8fdacc538c")

build() {
	sed -i "3s/VERSION/$_pkgname-$_pkgver/g" CCHv2.sh
}

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/icons
	mkdir -p $pkgdir/usr/lib/$_pkgname
	mkdir -p $pkgdir/usr/share/applications
	pwd

	cp CCHv2.sh $pkgdir/usr/bin/$_pkgname
	chmod +x $pkgdir/usr/bin/$_pkgname

	cp "$_pkgname-$_pkgver"/favicon.png $pkgdir/usr/share/icons/CCHv2.png
	cp -r "$_pkgname-$_pkgver" $pkgdir/usr/lib/$_pkgname/

	cp CCHv2.desktop $pkgdir/usr/share/applications/
}
