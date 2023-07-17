# Maintainer: nezu <nezu@nezu.cc>
pkgname=givemebadge-git
_pkgname=givemebadge
pkgver=r79.e17fb70
pkgrel=1
pkgdesc="Pretty simple Discord bot to get the active developer badge"
arch=('any')
url="https://github.com/AlexFlipnote/GiveMeBadge"
license=('MIT')
depends=('python' 'python-colorama' 'python-requests' 'python-discord')
provides=('givemebadge')
conflicts=('givemebadge')
source=("start.sh" "$_pkgname::git+$url")
sha256sums=('ef09169e18bb768d482a156ce918b33738e2b97b124c13aede1373464b8f6642'
            'SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -Dm644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 "$_pkgname/index.py" -t "$pkgdir/usr/share/$_pkgname"
	install -Dm755 "start.sh" "$pkgdir/usr/bin/$_pkgname"
}
