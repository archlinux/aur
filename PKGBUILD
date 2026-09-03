# Maintainer: pineappletoad

pkgname=cangaroo-bin
pkgver=0.2.2.r64.gca7f907
_pkgrel_src=11
pkgrel=1
pkgdesc="Open source can bus analyzer software - with support for CANable / CANable2, CANFD, and other new features (precompiled)"
arch=('x86_64')
url="https://github.com/normaldotcom/cangaroo"
license=('GPL-2.0-only')
options=('!debug')
provides=('cangaroo')
conflicts=('cangaroo')
depends=(
    'bash'
    'gcc-libs'
    'glibc'
    'libnl'
    'qt5-charts'
    'qt5-base'
    'qt5-serialport'
)

source=("https://github.com/tubbywrestler/cangaroo-bin/releases/download/${pkgver}-${_pkgrel_src}/cangaroo-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst")
sha256sums=('d632615ce8605d5a070e30dde32c68c258e5a5d698db3a5bdbc07a261da9cdc7')

package() {
    bsdtar -xf "${srcdir}/cangaroo-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
