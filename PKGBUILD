# Maintainer: Maximilian Köhl <linuxmaxi@googlemail.com>
pkgname=uberwriter
pkgver=12.07.3
pkgrel=5
pkgdesc="A simple Markdown editor that offers a lot of features."
arch=(any)
url="http://uberwriter.wolfvollprecht.de/"
license=('GPL')
depends=('python2-gtkspellcheck' 'python2-gobject' 'ttf-ubuntu-font-family')
optdepends=('pandoc-static')
makedepends=('python2-distutils-extra')
install=uberwriter.install

source=(
	"https://launchpad.net/uberwriter/trunk/12.11/+download/uberwriter_12.11.02-public1-beta.tar.gz" 
	remove_tab_size.patch)
noextract=()

md5sums=('SKIP' 'SKIP')

build() {
	# patch -p0 $srcdir/uberwriter/uberwriter/UberwriterWindow.py < remove_tab_size.patch
}

package() {
	cd uberwriter
	python2 setup.py install --root=${pkgdir}
}
