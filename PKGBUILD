# Maintainer: Emmie Maeda <emmie.maeda@gmail.com>

pkgname="days-until-git"
pkgver=0.1.rf01b6ec
pkgrel=1
pkgdesc='A command-line program to give you the number of days until or since certain events.'
arch=('any')
url="https://gitlab.com/emmiegit/${pkgname%-git}"
license=('GPL2')
depends=('python')
makedepends=('git')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
source=("git+https://gitlab.com/emmiegit/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	echo "0.1.r$(git describe --always)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m755 'days_until.py' "$pkgdir/usr/bin/daysuntil"
	install -D -m644 'sample_event_list.txt' "$pkgdir/usr/share/${pkgname%-git}/sample_event_list.txt"
	install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

