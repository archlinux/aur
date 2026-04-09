# Maintainer: omarplayz <omarplayzsounds@gmail.com>

pkgname=deta-surf
pkgver=1.4.6_beta.0
pkgrel=1
pkgdesc="Deta Surf, an AI notebook that brings all your files and the web directly into your stream of thought."
arch=('x86_64')
url="https://deta.surf"
license=('Apache-2.0')
depends=(glibc)

source=(
  "deta-surf-1.4.6_beta.0.AppImage::https://github.com/deta/surf/releases/download/1.4.6-beta.0/Surf-1.4.6-beta.0.x86_64.AppImage"
  "deta-surf.desktop"
)

sha256sums=(
  '568b314e1c65afd0979343ea685d1bdc844bfa06795a3b6d13450409539f452c'
  'SKIP'
)

package() {
    install -Dm755 "$srcdir/deta-surf-1.4.6_beta.0.AppImage" "$pkgdir/usr/bin/deta-surf"

    install -Dm644 "$srcdir/deta-surf.desktop" \
        "$pkgdir/usr/share/applications/deta-surf.desktop"

    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/deta-surf.png" <<EOF
$(curl -s https://raw.githubusercontent.com/deta/surf/main/app/src/renderer/assets/icon_512.png)
EOF
}
