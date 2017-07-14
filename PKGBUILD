# Maintainer: BasioMeusPuga <disgruntled.mob@gmail.com>

pkgname=twitchy-git
_pkgname=twitchy
pkgdesc="CLI livestreamer / streamlink wrapper for twitch.tv"
pkgver=r134.5f514d2
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/BasioMeusPuga/twitchy"
license=('GPL3')
provides=('twitchy')
conflicts=('twitchy')
depends=('python' 'streamlink' 'python-requests')
makedepends=('git')
optdepends=('livestreamer: alternate backend')
source=("git://github.com/basiomeuspuga/${_pkgname}.git")
md5sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
 	mkdir -p ${pkgdir}/usr/share/twitchy/

	install -Dm 755 twitchy/alarm.mp3 $pkgdir/usr/share/twitchy/alarm.mp3
	install -Dm 755 twitchy/twitchy.py $pkgdir/usr/bin/twitchy
}
