# Maintainer: Max Bruckner
_basename=mirrorselect
pkgname=gentoo-$_basename
pkgver=2.2.5
pkgrel=1
pkgdesc="Script for selecting Gentoo mirrors."
arch=( 'any' )
url="http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-portage/mirrorselect/mirrorselect-9999.ebuild"
license=('GPL2')
depends=('python' 'netselect' 'dialog' 'ssl-fetch>=0.2' )
source=("git://anongit.gentoo.org/proj/mirrorselect.git#tag=$pkgver")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${_basename}"
    ./setup.py build
}

package() {
    cd "${srcdir}/${_basename}"
    ./setup.py install --prefix='/usr/' --root="$pkgdir"
}
