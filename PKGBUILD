# Maintainer: Erdem Goksel <erdem.goksel.dev at gmail dot com>

pkgname=seneka-ebdys-maltepe
pkgver=2026.07.23.17
pkgrel=6
pkgdesc="Maltepe University Seneka EBDYS ClickOnce client for Wine"
arch=('x86_64')
url="https://ebys.maltepe.edu.tr/"
license=('custom:proprietary')
depends=('bash' 'cabextract' 'curl' 'icoutils' 'wine' 'wine-gecko' 'winetricks' 'zenity')
source=(
  'seneka-ebdys'
  'seneka-ebdys-icon'
  'seneka-ebdys-setup'
  'seneka-ebdys-maltepe.desktop'
  'seneka-ebdys-maltepe.png.b64'
  'LICENSE.packaging'
  'LICENSE.upstream'
)
sha256sums=('2a9bcf62ec4bf8deb71e5e55a93bfaca2267665bddbc907547b7f496d1c07acc'
            '2f8441f068eec4c46f186b30f95a28ceb0ae5c09a10b87e95a209019203cd7c4'
            'f9b49ec037e244e3dc5ca1cbefa15132e65a5926f17927572f581cb03a43eb22'
            '570f0d4f8ecfa5728c8c511adea4ba6db95c6d7c32351256b1eea96b4975ef09'
            'e8d0a45ff0b3281f023c4ccb416f0cdea3b9f89a154c18903a20025c8e5f9526'
            'bf76c9891b73c19070faa6bfc15b5c5f711f0ff30e76c9feb93a18886305ec13'
            '66d8e494758b5cf1ec47a6c85310e05138a29e5268535f6289bd2beff0f13e9c')

package() {
  install -Dm755 seneka-ebdys "$pkgdir/usr/bin/seneka-ebdys"
  install -Dm755 seneka-ebdys-icon "$pkgdir/usr/bin/seneka-ebdys-icon"
  install -Dm755 seneka-ebdys-setup "$pkgdir/usr/bin/seneka-ebdys-setup"
  install -Dm644 seneka-ebdys-maltepe.desktop \
    "$pkgdir/usr/share/applications/seneka-ebdys-maltepe.desktop"
  install -d "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  base64 -d seneka-ebdys-maltepe.png.b64 \
    >"$pkgdir/usr/share/icons/hicolor/48x48/apps/seneka-ebdys-maltepe.png"
  chmod 644 "$pkgdir/usr/share/icons/hicolor/48x48/apps/seneka-ebdys-maltepe.png"
  install -Dm644 LICENSE.packaging \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.packaging"
  install -Dm644 LICENSE.upstream \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.upstream"
}
