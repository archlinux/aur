# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgbase=bigjubeldesktop-git
pkgname=bigjubeldesktop-git
pkgver=0.2.0.r1.gd9cf9fc
pkgrel=1
pkgdesc="Desktop client for BigJubel: calculate current jubilees"
url="https://www.kabus.eu/git/bigjubeldesktop"
depends=('bigjubelweb' 'python-pywebview')
makedepends=('git' 'imagemagick' 'coreutils' 'sed')
provides=('bigjubeldesktop')
conflicts=('bigjubeldesktop')
license=('GPL')
arch=('any')
source=("bigjubeldesktop-git::git://www.kabus.eu/git/bigjubeldesktop")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
