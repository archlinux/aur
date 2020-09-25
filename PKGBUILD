# Maintainer: Chuan Ji <chuan@jichu4n.com>

pkgname=prc-tools-remix
pkgver=2.3.5
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
sha256sums=('d8c29e81c197ba7801d8331eddcb94990f780c96b3ccea83b60b08d8349c96a8')
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

