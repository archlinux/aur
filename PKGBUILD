# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=3.0
pkgrel=1
pkgdesc="A powerful GUI for Git"
arch=('any')
url="http://git-cola.github.com/"
license=('GPL')
depends=('git' 'python-pyqt5>=5.7' 'icu' 'qt5-svg')
makedepends=('asciidoc' 'docbook-xsl' 'rsync' 'xmlto' 'python-sphinx>=1.1.3')
optdepends=('python-pyinotify>=0.7.1: for inotify support'
'tk: to use the built-in ssh-askpass handler')
options=('!makeflags')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz")
sha256sums=('61958f998d4618e09ce0dd473411921818d13df838f32102ef5ded984a0d1a50')

build() {
	cd "$srcdir/${pkgname}-$pkgver"
	make all doc html
}

package() {
	cd "$srcdir/${pkgname}-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir" install{,-doc,-html}
}
