# Maintainer: Paolo Stivanin <info A,T paolostivanin D,O,T com>

pkgname=linux-source
_pkgname=linux
pkgver=4.14.15
pkgrel=1
pkgdesc='Source files for the Linux Kernel'
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
options=('!strip')
license=('GPL2')

source=(
"https://www.kernel.org/pub/linux/kernel/v4.x/${_pkgname}-${pkgver}.tar.xz"
"https://www.kernel.org/pub/linux/kernel/v4.x/${_pkgname}-${pkgver}.tar.sign"
)

sha256sums=(
'ffc393a0c66f80375eacd3fb177b92e5c9daa07de0dcf947e925e049352e6142'
'SKIP')

validpgpkeys=(
'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
'647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

package() {
    mkdir -p ${pkgdir}/usr/src
    mv "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/src/"
}
