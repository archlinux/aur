pkgname=better-github-bin
pkgver=4.4.0
pkgrel=1
pkgdesc="better github desktop app (prebuilt appimage)"
arch=('x86_64')
url="https://github.com/krishkalaria12/better-github-desktop"
license=('MIT')
depends=('fuse2')
options=(!strip)
source=("better-github.AppImage::https://github.com/krishkalaria12/better-github-desktop/releases/download/v${pkgver}/better-github_0.1.0_amd64.AppImage")
sha256sums=('4d8134c0c4587ee472e01cb70c948f75d148b5de7e45d06ddc4fd43e542faa3c')

package() {
  install -Dm755 "${srcdir}/better-github.AppImage" "${pkgdir}/opt/better-github/better-github.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/better-github" << 'SH'
#!/bin/sh
exec /opt/better-github/better-github.AppImage "$@"
SH
}
