# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-advanced-separator
pkgname=plasma6-applets-advanced-separator
pkgver=0.2.0
pkgrel=1
pkgdesc="Customizable separator widget for the KDE Plasma Desktop"
arch=('any')
url="https://github.com/luisbocanegra/plasma-advanced-separator"
license=('GPL3')
depends=('plasma-desktop')
makedepends=('gcc' 'extra-cmake-modules' 'gettext' 'python')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('89ecd64ac0de8048129291a0f5ed23abb80161380155ffdb4bc0febf3b258187')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  python ./kpac i18n --no-merge
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
