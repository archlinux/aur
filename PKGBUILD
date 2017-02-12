# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=2.10
pkgrel=1
pkgdesc="A powerful GUI for Git"
arch=('any')
url="http://git-cola.github.com/"
license=('GPL')
depends=('git' 'python-pyqt5>=5.7' 'icu')
makedepends=('asciidoc' 'docbook-xsl' 'rsync' 'xmlto' 'python-sphinx>=1.1.3')
optdepends=('python-pyinotify>=0.7.1: for inotify support'
'tk: to use the built-in ssh-askpass handler')
options=('!makeflags')
source=("https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz")
sha256sums=('fd310087ad4c4ccd22829ae319d9409ea3ff872f5391b999de130faaf77f4e1c')

build() {
	cd "$srcdir/${pkgname}-$pkgver"
	make all doc html
}

package() {
	cd "$srcdir/${pkgname}-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir" install{,-doc,-html}
}
