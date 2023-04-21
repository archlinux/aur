# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>

pkgname=gawk-fake
pkgver=1
pkgrel=1
pkgdesc="A fake gawk for those who prefer a different awk interpreter (CANNOT BUILD GLIBC WITHOUT GAWK)"
arch=('any')
license=('public-domain')
depends=('bash' 'mawk') # This package can use nawk or something else instead. Just replace every instance of `mawk` with e.g., `nawk`
provides=('awk' 'gawk')
conflicts=('gawk')

package() {
	mkdir -p "$pkgdir/usr/bin/"
	sudo touch "$pkgdir/usr/bin/gawk"
	sudo ln -s "mawk" "$pkgdir/usr/bin/awk"
}
