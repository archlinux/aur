# Maintainer: Chuan Ji <chuan@jichu4n.com>

pkgname=prc-tools-remix
pkgver=2.3.6
pkgrel=1
pkgdesc='C/C++ toolchain for Palm OS'
arch=('i686' 'pentium4' 'x86_64')
url="https://github.com/jichu4n/prc-tools-remix"
license=('GPL')
makedepends=('texinfo' 'gperf')
depends=('ncurses')
optdepends=(
  'palm-os-sdk-git: Palm OS SDK files'
  'pilrc: Palm OS resource compiler')
source=("https://github.com/jichu4n/prc-tools-remix/archive/v${pkgver}.tar.gz")
sha256sums=('0d8da2c2a4458f24a371f6739922b0cd019ae968d205d291a5a9dfe5a9c78f09')
# Options:
# - !makeflags: Parallel builds result in build errors.
# - !buildflags: Default build flags result in build errors.
# - !strip: Stripping breaks static libs installed by this package.
options=('!makeflags' '!buildflags' '!strip')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Environment variables:
  # - SHELL: Compilation can fail if the user has a different default shell
  #   like fish.
  env \
    SHELL=/bin/sh \
    ./tools/build.sh "${pkgdir}"
}

# vim:set ts=2 sw=2 et:

