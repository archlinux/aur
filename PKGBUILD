# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Aaron <aaron@aaronlindsay.com>
# Contributor: TheGuy <lowelink26381@gmail.com>

pkgname=devkitarm-bin
pkgver=r44
pkgrel=1
pkgdesc="ARM toolchain for GP32, Nintendo DS and GBA homebrew development (precompiled)"
arch=('i686' 'x86_64')
url="http://www.devkitpro.org/"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
provides=("devkitarm")
conflicts=("devkitarm")
depends=('gcc-libs' 'sh' 'zlib')
optdepends=('libtinfo: for arm-none-eabi-gdb')
optdepends_x86_64=('expat: for arm-none-eabi-gdb'
                   'libudev.so.0: for st-link and dfu-util')
install=devkitarm.install
source=("devkitarm.sh")
source_i686=("http://downloads.sourceforge.net/sourceforge/devkitpro/devkitARM_$pkgver-i686-linux.tar.bz2")
source_x86_64=("http://downloads.sourceforge.net/sourceforge/devkitpro/devkitARM_$pkgver-x86_64-linux.tar.bz2")
sha256sums=('fc5489fab5ee4ce5cd53c2e1549fd2958872a6777324920b89e03b88584072db')
sha256sums_i686=('0c2d0021a9bfd8bf4c81b723b33a783eb6afab02cd54ed5980f57b1e58d73b95')
sha256sums_x86_64=('147d0faa7f4235dd0ef91e286e0df8c3ac39d4076bbd3a23c8e15c85cf17f953')

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r devkitARM "$pkgdir"/opt/devkitpro
  # export environment variables
  install -Dm755 devkitarm.sh "$pkgdir"/etc/profile.d/devkitarm.sh
}
