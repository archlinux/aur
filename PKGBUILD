# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=mini_al-git
pkgver=r1298.1ca6f80
pkgrel=1
pkgdesc='Single file audio playback and capture library.'
arch=('any')
url='https://github.com/dr-soft/miniaudio'
license=('MIT')
depends=()
makedepends=('git')
conflicts=('mini_al' 'miniaudio')
provides=('mini_al' 'miniaudio')
source=('git+https://github.com/dr-soft/miniaudio.git')
md5sums=('SKIP')

pkgver() {
  cd miniaudio
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd miniaudio
  install -dm755 "${pkgdir}/usr/include/mini_al/"
  install -m644 miniaudio.h "${pkgdir}/usr/include/mini_al/miniaudio.h"
  install -dm755 "${pkgdir}/usr/include/mini_al/extras/"
  install -m644 extras/*.h "${pkgdir}/usr/include/mini_al/extras/"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/mini_al-git/LICENSE
}
