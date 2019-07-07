# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=3.4
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
sha256sums=('763e382d8b32427539585d17ec6fe92026c073f6d31a864a5816ebe22cf245bc')

build() {
	cd "$srcdir/${pkgname}-$pkgver"
	make all doc html
}

package() {
	cd "$srcdir/${pkgname}-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir" install{,-doc,-html}
}
