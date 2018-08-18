# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=mini_al-git
pkgver=r785.b51cdd3
pkgrel=1
pkgdesc='Single file audio playback and capture library.'
arch=('any')
url='https://github.com/dr-soft/mini_al'
license=('custom')
depends=()
makedepends=('git')
conflicts=(mini_al)
provides=(mini_al)
source=('git+https://github.com/dr-soft/mini_al.git')
md5sums=('SKIP')

pkgver() {
  cd mini_al
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd mini_al
  install -dm755 "${pkgdir}/usr/include/mini_al/"
  install -m644 mini_al.h "${pkgdir}/usr/include/mini_al/mini_al.h"
  install -dm755 "${pkgdir}/usr/include/mini_al/extras/"
  install -m644 extras/*.h "${pkgdir}/usr/include/mini_al/extras/"
  install -Dm644 README.md ${pkgdir}/usr/share/licenses/mini_al-git/LICENSE
}
