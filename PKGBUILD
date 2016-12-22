# Maintainer: BasioMeusPuga <disgruntled.mob@gmail.com>

pkgname=twitchy-git
_pkgname=twitchy
pkgdesc="CLI livestreamer wrapper for twitch.tv"
pkgver=r119.97431c0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/BasioMeusPuga/twitchy"
license=('GPL3')
provides=('twitchy')
conflicts=('twitchy')
depends=('python' 'livestreamer' 'python-requests')
makedepends=('git')
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
