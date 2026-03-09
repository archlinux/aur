# Maintainer: invisi101 <https://github.com/invisi101>
pkgname=bigsnatch-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Real-time eBPF network connection monitor — see what your computer is reaching out to"
arch=('x86_64')
url="https://github.com/invisi101/bigsnatch"
license=('GPL-3.0-only')
depends=('polkit')
provides=('bigsnatch')
conflicts=('bigsnatch')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/bigsnatch-${pkgver}-x86_64.tar.gz")
sha256sums=('efb098facf31b2f30b6a0afdead8e98d7ff7f31d32f0914c75c1ca8242fb3bd3')

package() {
  cd "bigsnatch-${pkgver}-x86_64"

  install -Dm755 bigsnatch-daemon "$pkgdir/usr/bin/bigsnatch-daemon"
  install -Dm755 bigsnatch "$pkgdir/usr/bin/bigsnatch"
  install -Dm644 bigsnatch-daemon.service "$pkgdir/usr/lib/systemd/system/bigsnatch-daemon.service"
  install -Dm644 bigsnatch.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/bigsnatch.svg"
  install -Dm644 bigsnatch.desktop "$pkgdir/usr/share/applications/bigsnatch.desktop"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/bigsnatch/LICENSE"
}
