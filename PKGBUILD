# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=2.5
pkgrel=1
pkgdesc="A powerful GUI for Git"
arch=('any')
url="http://git-cola.github.com/"
license=('GPL')
depends=('git' 'python-pyqt4>=4.4' 'icu')
makedepends=('asciidoc' 'docbook-xsl' 'rsync' 'xmlto' 'python-sphinx>=1.1.3')
optdepends=('python-pyinotify>=0.7.1: for inotify support'
'tk: to use the built-in ssh-askpass handler')
options=('!makeflags')
source=("https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz")
sha256sums=('683d4b1c3df094a092f57e1b6439e5bfd1a74f6421792022de96de5039ad7279')

build() {
	cd "$srcdir/${pkgname}-$pkgver"
	make all doc html
}

package() {
	cd "$srcdir/${pkgname}-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir" install{,-doc,-html}
}
