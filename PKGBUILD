# Maintainer: grgergo <gergo@tutanota.de>

pkgname=gloriousctl
pkgver=latest
pkgrel=1
pkgdesc='A utility to adjust the settings of Model O/D mice on Linux'
license=('custom:EUPL-1.2')
url='https://github.com/enkore/gloriousctl'

arch=('x86_64')
depends=('hidapi')
makedepends=('git')
source=('git+https://github.com/enkore/gloriousctl')
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "gloriousctl" "$pkgdir/usr/bin/gloriousctl"
}
