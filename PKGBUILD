# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=mpv-webm-bin-git
pkgver=r86.13f93e8
pkgrel=1
pkgdesc='Simple WebM maker for mpv'
arch=(any)
url=https://github.com/ekisu/mpv-webm
license=(MIT)
depends=(mpv)
makedepends=(git)
provides=("${pkgname%-bin-git}")
conflicts=("${pkgname%-bin-git}")
source=(git+"${url}".git)
md5sums=(SKIP)

pkgver() {
	cd "${pkgname%-bin-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm644 "${pkgname%-bin-git}/build/webm.lua" -t "$pkgdir/usr/lib/mpv"
	install -Dm644 "${pkgname%-bin-git}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
