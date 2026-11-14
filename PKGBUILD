# Maintainer: Anton Filimonov <anton.filimonov@gmail.com>
# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=klogg-bin-git
pkgver=26.10.28.1348
_subversion=0
pkgrel=2
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
# comment: SoftExpert <softexpert at gmail dot com>
# unfortunately, the original repo at https://github.com/variar/klogg does not have any activity in more than 2 years
# I switched to a maintained fork
_activefork='https://github.com/ZEACENT/klogg'
license=('GPL-3.0-only')
provides=('klogg')
conflicts=('klogg')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'qt6-base'
    'qt6-5compat'
    'qt6-svg'
    'hicolor-icon-theme'
    'zlib-ng-compat'
)

# source=("klogg_bin_${_klogg_version}.tar.gz::https://github.com/variar/klogg/releases/download/continuous-linux/klogg-${_klogg_version}-bin.tar.gz")
source=("${pkgname%-git}-${pkgver}.deb::${_activefork}/releases/download/continuous/klogg-${pkgver}-noble-vs-gen.deb")
sha256sums=('a4482758401ac4e05aebdd910000262107dfe2a2dd6c9d854fce89efc6743138')

prepare() {
    ar x "${srcdir}/${pkgname%-git}-${pkgver}.deb"
    tar xf data.tar.gz
}

#pkgver() {
#  echo $_klogg_version
#}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share"
  cp -r "usr" "${pkgdir}/"
}

