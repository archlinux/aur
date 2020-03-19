# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=ibus-deamon
pkgver=0.0.0
pkgrel=0
pkgdesc='SystemD user service for IBus'
arch=(any)
license=(MIT)
url='https://github.com/KSXGitHub/ibus-daemon.pkgbuild.git'
depends=(systemd ibus)
makedepends=(pkgconf)
source=(
  ibus.service
  LICENSE.md
)
sha512sums=(SKIP SKIP)

package() {
  cd "$srcdir"
  install -Dm644 ibus.service "$pkgdir"/"$(pkg-config systemd --variable=systemduserunitdir)"/ibus.service
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/ibus-deamon/LICENSE.md
}
