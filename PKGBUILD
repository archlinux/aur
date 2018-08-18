# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=zstr-git
pkgver=r38.d9e0254
pkgrel=1
pkgdesc='A C++ header-only ZLib wrapper'
arch=('any')
url='https://github.com/sandsmark/zstr'
license=('MIT')
depends=('zlib')
makedepends=('git')
conflicts=(zstr)
provides=(zstr)
source=('git+https://github.com/sandsmark/zstr.git')
md5sums=('SKIP')

pkgver() {
  cd zstr
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd zstr
  install -dm755 "${pkgdir}/usr/include/"
  install -m644 src/zstr.hpp "${pkgdir}/usr/include/zstr.hpp"
  install -m644 src/zstr.hpp "${pkgdir}/usr/include/strict_fstream.hpp"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/zstr-git/LICENSE
}
