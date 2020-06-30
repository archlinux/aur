# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>

pkgname='archiso-git'
pkgver=44.r18.gb08f168
pkgrel=1
pkgdesc='Tools for creating Arch Linux live and install iso images'
arch=('any')
url="https://gitlab.archlinux.org/archlinux/archiso"
license=('GPL')
depends=('arch-install-scripts' 'curl' 'dosfstools' 'edk2-shell' 'libisoburn' 'lynx' 'squashfs-tools')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=('git+https://gitlab.archlinux.org/archlinux/archiso.git')
validpgpkeys=('C7E7849466FE2358343588377258734B41C31549') # David Runge <dvzrv@archlinux.org>
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}/" install
}
