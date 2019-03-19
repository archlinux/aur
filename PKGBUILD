# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=slack-cli-git
pkgver=r279.46d2274
pkgrel=1
pkgdesc="Powerful Slack CLI via pure bash. Rich messaging, uploads, posts, piping, oh my!"
arch=('any')
url="https://github.com/rockymadden/slack-cli"
license=('MIT')
depends=('bash')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	"${pkgname%-git}::git+https://github.com/rockymadden/slack-cli#branch=master"
	)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "$srcdir/${pkgname%-git}/src/slack" "$pkgdir/usr/bin/slack-cli"
}

md5sums=('SKIP')
