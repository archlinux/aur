# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=md2term-git
pkgver=md2term.0.0.7.ff9578c
pkgrel=1
pkgdesc='Markdown parser for the terminal, based on bash and pandoc'
arch=(any)
url='https://codeberg.org/blau_araujo/md2term'
license=('GPL3')
depends=('bash' 'pandoc' 'git')
provides=('md2term')
source=('git+https://codeberg.org/blau_araujo/md2term/')
md5sums=('SKIP')

pkgver() {
	cd "$provides"
  	git describe --long --tags | sed 's/^v//;s/.alpha//;s/\([^-]*-g\)//;s/-/./g'
}

package() {
	cd "$srcdir/md2term"
	install -Dm755 md2term "$pkgdir/usr/bin/md2term"
	install -Dm755 md2term.1 "$pkgdir/usr/share/man/man1/md2term.1"
	install -Dm755 themes/dark-theme "$pkgdir/usr/share/md2term/themes/dark-theme"
}
