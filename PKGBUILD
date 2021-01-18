# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=3.8
pkgrel=1
pkgdesc="A powerful GUI for Git"
arch=('any')
url="http://git-cola.github.com/"
license=('GPL')
depends=('git' 'python-pyqt5' 'icu' 'qt5-svg')
makedepends=('asciidoc' 'docbook-xsl' 'rsync' 'xmlto' 'python-sphinx')
optdepends=('python-pyinotify: for inotify support'
            'python-pygments: syntax highlighting'
            'python-pyinotify: for inotify support'
            'tcl: to use the built-in ssh-askpass handler')
options=('!makeflags')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz")
sha256sums=('ea482ca32fe142ddba500d2edf3a05f11e31cf193e5d7a944f3fe28c9ab123d4')

build() {
	cd "$srcdir/${pkgname}-$pkgver"
	make all doc html man
}

package() {
	cd "$srcdir/${pkgname}-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir" install{,-doc,-html,-man}
}
