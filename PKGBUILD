# Maintainer: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
pkgname=raleigh-reloaded-git
pkgver=v1.1.r4.89ce481
pkgrel=1
pkgdesc="A GTK theme aiming to revive the classic Raleigh theme"
arch=('any')
url="https://github.com/vlastavesely/raleigh-reloaded"
license=('GPL2')
depends=('gtk3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('raleigh-reloaded::git+https://github.com/vlastavesely/raleigh-reloaded.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir"/usr install
}
