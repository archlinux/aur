# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
# Contributor: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=git-remote-hg
pkgver=0.6
pkgrel=1
pkgdesc='Bidirectional bridge between Git and Mercurial'
arch=('any')
url='https://github.com/felipec/git-remote-hg'
license=('GPL2')
depends=('git' 'mercurial')
makedepends=('asciidoctor')
source=("https://github.com/felipec/git-remote-hg/archive/v${pkgver}.tar.gz")
md5sums=('8a1acaba6d5f2acd453870b136695eba')

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
