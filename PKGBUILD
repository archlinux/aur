# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=md2term-git
_pkgname=md2term
pkgdesc='Markdown parser for the terminal, based on bash and pandoc'
arch=(any)
url='https://codeberg.org/blau_araujo/md2term'
pkgrel=1
license=('GPL-3.0')
depends=('bash' 'pandoc')
source=('git+https://codeberg.org/blau_araujo/md2term/')
md5sums=('SKIP')
provides=($_pkgname)
pkgver=md2term.alpha.0.0.6.r1.g341d8d1

pkgver() {
	cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_pkgname"
	install -Dm755 md2term "$pkgdir/usr/bin/md2term"
	install -Dm755 md2term.1 "$pkgdir/usr/share/man/man1/md2term.1"
}
