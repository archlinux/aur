# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgbase=bigjubeldesktop-git
pkgname=bigjubeldesktop-git
pkgver=0.2.2.r4.ge10fc3c
pkgrel=1
pkgdesc="Desktop client for BigJubel: calculate current jubilees"
url="https://gitlab.com/dkabus/bigjubeldesktop"
depends=('bigjubelweb' 'python-pywebview')
makedepends=('git' 'imagemagick' 'coreutils' 'sed')
provides=('bigjubeldesktop')
conflicts=('bigjubeldesktop')
license=('GPL')
arch=('any')
source=("bigjubeldesktop-git::git+https://gitlab.com/dkabus/bigjubeldesktop")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
