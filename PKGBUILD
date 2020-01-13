# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=3.6
pkgrel=1
pkgdesc="A powerful GUI for Git"
arch=('any')
url="http://git-cola.github.com/"
license=('GPL')
depends=('git' 'python-pyqt5' 'icu' 'qt5-svg')
makedepends=('asciidoc' 'docbook-xsl' 'rsync' 'xmlto' 'python-sphinx')
optdepends=('python-pyinotify: for inotify support'
'tk: to use the built-in ssh-askpass handler')
options=('!makeflags')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz")
sha256sums=('63369f519f81988c2d167ba2c59ad53644d3fac2b7be1e12d3f1df9b8fd91839')

build() {
	cd "$srcdir/${pkgname}-$pkgver"
	make all doc html
}

package() {
	cd "$srcdir/${pkgname}-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir" install{,-doc,-html}
}
