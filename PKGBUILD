# Maintainer: Wallace Martins <wallacemartinss@gmail.com>
pkgname=hubdev-bin
pkgver=1.23.0
pkgrel=1
pkgdesc="Hybrid Development Environment Manager — manage local dev services with a native GUI"
arch=('x86_64')
url="https://hubdev.io"
license=('custom')
depends=('gtk3' 'webkit2gtk-4.1')
optdepends=(
  'docker: Docker-based service management'
  'php-fpm: PHP FastCGI Process Manager'
  'composer: PHP dependency manager'
)
provides=('hubdev')
conflicts=('hubdev')
source=("hubdev-${pkgver}-linux-amd64::https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v${pkgver}/hubdev-linux-amd64"
        "hubdev.desktop"
        "hubdev.png::https://apt.hubdev.io/assets/hubdev.png")
sha256sums=('5d58632469b084a4bc9128920762b20392b0b3c71d869fa8929da6e825e57cef'
  'SKIP'
  'SKIP')

package() {
  install -Dm755 "hubdev-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/hubdev"
  install -Dm644 "hubdev.desktop" "${pkgdir}/usr/share/applications/hubdev.desktop"
  install -Dm644 "hubdev.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hubdev.png"
}
