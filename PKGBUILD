# Maintainer: Devin Ryan <me@devin.codes>

pkgname=toggl-cli-git
pkgver=r154.85f4ec6
pkgrel=1
pkgdesc="Command line client for Toggl timekeeping"
arch=('any')
url="https://github.com/drobertadams/toggl-cli"
license=('MIT')
depends=('python' 'python-dateutil' 'python-iso8601' 'python-pytz' 'python-requests')
makedepends=('git')
provides=('toggl-cli')
conflicts=('toggl-cli')
source=('git+https://github.com/drobertadams/toggl-cli.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/toggl-cli"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/toggl-cli"
	mkdir -p $pkgdir/usr/bin
	cp toggl.py $pkgdir/usr/bin/toggl
	chmod 0755 $pkgdir/usr/bin/toggl
}
