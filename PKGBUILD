# Maintainer: Adam Mlady <adam.mlady@elevated.ovh> -> https://github.com/TheElevatedOne
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Linus Dierheimer <Linus@Dierheimer.de>

pkgname=ghost-dl-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Kingdom Hearts Insider Game OST Archive Downloader CLI/TUI"
arch=(x86_64)
url="https://github.com/TheElevatedOne/ghost-dl"
license=('GPL-3.0-or-later')
depends=(glibc curl ncurses)
provides=(ghost-dl)
conflicts=(ghost-dl)
source=("https://github.com/TheElevatedOne/ghost-dl/releases/download/${pkgver}/ghost-dl-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('35352281c99fdf8486c870b0ee188c0c48fa939eb0ae97dd79b34c1959f9ff08')

package() {
  cd "${srcdir}/ghost-dl-${pkgver}-linux-x86_64"

  install -Dm755 ghost-dl "${pkgdir}/usr/bin/ghost-dl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [ -f man/ghost-dl.1.gz ]; then
    install -Dm644 man/ghost-dl.1.gz "${pkgdir}/usr/share/man/man1/ghost-dl.1.gz"
  fi
}
