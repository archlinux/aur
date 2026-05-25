# Maintainer: up-the-hill <hello@avijya.sh>

pkgname=boscaceoil-blue-bin
pkgver=3.1.2
pkgrel=2
pkgdesc="A simple and beginner-friendly app for making music"
arch=('x86_64')
url=https://yurisizov.itch.io/boscaceoil-blue
license=('MIT')
provides=('boscaceoil-blue')
conflicts=('boscaceoil-blue-bin' 'boscaceoil-blue-git' 'boscaceoil-blue')
makedepends=('unzip')
options=('!strip')
source=(
  "https://github.com/YuriSizov/boscaceoil-blue/releases/download/$pkgver-stable/boscaceoil-blue-linux-x86_64.zip"
  "boscaceoil-blue.desktop"
  "boscaceoil-blue.png"
  "LICENSE::https://raw.githubusercontent.com/YuriSizov/boscaceoil-blue/main/LICENSE"
)
sha256sums=(
  'c2474e8f1d0d59fbff45ba986b9e234a5ff5c182ded2c5769d6e30ef0cdc655d'
  '8f54bf50462379958c5a327b16a48e26e77422fc79a1afef2928e1be328af269'
  'a3c2c7232b3393c600756ade3b05910f0711581a4237eac4fd76311415244e13'
  'SKIP'
)

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/applications/"

  install -Dm755 "boscaceoil-blue-linux-x86_64/boscaceoil-blue.x86_64" "${pkgdir}/opt/${pkgname}/boscaceoil-blue"
  install -Dm755 "boscaceoil-blue-linux-x86_64/libgdsion.linux.template_release.x86_64.so" "${pkgdir}/opt/${pkgname}/libgdsion.linux.template_release.x86_64.so"

  install -Dm644 "boscaceoil-blue.desktop" "${pkgdir}/usr/share/applications/boscaceoil-blue.desktop"

  ln -s "/opt/${pkgname}/boscaceoil-blue" "${pkgdir}/usr/bin/boscaceoil-blue"

  # install license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"


  # install icons
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -m644 boscaceoil-blue.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/boscaceoil-blue.png"
}
