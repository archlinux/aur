# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=depixelator-git
pkgver=r8.c09fca8
pkgrel=1
pkgdesc='A small header-only c++ library to depixelize pixels to contours'
arch=('any')
url='https://github.com/reMarkable/depixelator'
license=('BSD')
makedepends=('git')
conflicts=(depixelator)
provides=(depixelator)
source=('git+https://github.com/reMarkable/depixelator.git' 'LICENSE')
md5sums=('SKIP' 'cdaee571ecbbc34f8d58891422dda7a7')

pkgver() {
  cd depixelator
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 0644 LICENSE -t "${pkgdir}/usr/share/licenses/depixelator-git"

  cd depixelator
  install -Dm 0644 depixelator.h -t "${pkgdir}/usr/include/"
}
