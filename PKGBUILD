# Maintainer: Max Bruckner
_basename=mirrorselect
pkgname=gentoo-$_basename
pkgver=2.2.3
pkgrel=3
pkgdesc="Script for selecting Gentoo mirrors."
arch=( 'any' )
url="http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-portage/mirrorselect/mirrorselect-9999.ebuild"
license=('GPL2')
depends=('python' 'netselect' 'dialog' 'ssl-fetch>=0.2' )
source=("https://dev.gentoo.org/~dolsen/releases/${_basename}/${_basename}-${pkgver}.tar.gz")
sha512sums=('af1d3657b9ff5a6184ebfd89579a1bdbf11f7389ca12d4cd7a41cd136a553732cbbfb7675e25f7d79756b0b9e74b496d28ee5fdc8872173825262fae0052e8e2')

build() {
    cd "${srcdir}/${_basename}-${pkgver}"
    ./setup.py build
}

package() {
    cd "${srcdir}/${_basename}-${pkgver}"
    ./setup.py install --prefix='/usr/' --root="$pkgdir"
}
