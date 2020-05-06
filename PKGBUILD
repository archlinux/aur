# Maintainer: Mitchell Reiff <mreiff@disroot.org>
# Contributor: Tyler Kaminski

pkgname=shadowreplay-git
pkgver=r50.3945d92
pkgrel=1
pkgdesc="Shadowplay's Replay Feature On Linux For Nvidia, AMD and Intel."
arch=('any')
url="https://github.com/MAPReiff/ShadowRePlay-Linux.git"
license=('MIT')
depends=('ffmpeg' 'libnotify')
optdepends=('xbindkeys')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/ShadowRePlay-Linux"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/ShadowRePlay-Linux"
	./install
}
