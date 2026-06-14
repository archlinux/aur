# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=md2term-git
pkgver=r32.ff9578c
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
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$srcdir/md2term"
	install -Dm755 md2term "$pkgdir/usr/bin/md2term"
	install -Dm755 md2term.1 "$pkgdir/usr/share/man/man1/md2term.1"
	install -Dm755 themes/dark-theme "$pkgdir/usr/share/md2term/themes/dark-theme"
}
