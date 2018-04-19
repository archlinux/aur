# Maintainer: alzeih <alzeih@users.noreply.github.com>
pkgname=slacktee-git
pkgver=v1.2.15.r5.ca68683
pkgrel=1
pkgdesc="slacktee is a bash script that works like tee command. Instead of writing the standard input to files, slacktee posts it to Slack."
arch=('any')
url="https://github.com/course-hero/slacktee"
license=('Apache')
depends=('bash')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=slacktee-git.install
source=('slacktee::git+https://github.com/course-hero/slacktee')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m 755 slacktee.sh $pkgdir/usr/bin/slacktee.sh
}
