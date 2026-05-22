# Maintainer: Wallace Martins <wallacemartinss@gmail.com>
pkgname=hubdev-bin
pkgver=1.19.0
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
sha256sums=('965c5d7d6736b8fc1bf89fcb7aec0229ec0be4d1f7bcb0aad95bcaabecd3bc74'
  'SKIP'
  'SKIP')

package() {
  install -Dm755 "hubdev-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/hubdev"
  install -Dm644 "hubdev.desktop" "${pkgdir}/usr/share/applications/hubdev.desktop"
  install -Dm644 "hubdev.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hubdev.png"
}
