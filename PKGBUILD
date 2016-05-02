# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
# Contributor: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=git-remote-hg
pkgver=0.3
pkgrel=1
pkgdesc='Bidirectional bridge between Git and Mercurial'
arch=('any')
url='https://github.com/fingolfin/git-remote-hg'
license=('GPL2')
depends=('git' 'mercurial')
makedepends=('asciidoc')
source=("https://github.com/fingolfin/git-remote-hg/archive/v${pkgver}.tar.gz")
md5sums=('0132373c8ecabdf88054790114cd883e')

build () {
	cd "$srcdir/${pkgname}-${pkgver/+/-}"
	make all doc
}

# Cannot run tests until https://bugs.archlinux.org/task/32296 is resolved.
# check () {
# 	cd "$srcdir/${pkgname}-${pkgver/+/-}"
# 	make test
# }

package () {
	cd "$srcdir/${pkgname}-${pkgver/+/-}"
	make prefix=/usr DESTDIR="$pkgdir" install install-doc
}
