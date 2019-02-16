#Maintainer: Martin Friedrich <npanic@acid.wtf>
#Contributor: Martin Friedrich <npanic@acid.wtf>
pkgname=kunst
_pkgname=kunst
pkgver=20190215
pkgrel=1
pkgdesc="kunst is a deamon that extracts the album art from the songs playing in mpd."
arch=('any')
url="https://github.com/sdushantha/kunst"
license=('MIT')
depends=('sxiv' 'imagemagick' 'bash' 'ffmpeg' 'mpc')
makedepends=('git')
provides=($_pkgname)
source=("git+https://github.com/networkpanic/kunst.git")
md5sums=('SKIP')

pkgver()
{
	cd $_pkgname
	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -t "$pkgdir/usr/bin" "$_pkgname"
}
