# Maintainer: arthurr0 <koeckiartur@gmail.com>
pkgname=mterminal-bin
_pkgname=mterminal
pkgver=0.2.1
pkgrel=1
pkgdesc="Custom terminal emulator with grouped tabs and warm dark UI (binary release)"
arch=('x86_64')
url="https://github.com/arthurr0/mTerminal"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
)
provides=("$_pkgname")
conflicts=("$_pkgname" "mterminal-git")
source=(
  "$_pkgname-$pkgver.AppImage::https://github.com/arthurr0/mTerminal/releases/download/v$pkgver/mTerminal_${pkgver}_amd64.AppImage"
  "https://raw.githubusercontent.com/arthurr0/mTerminal/v$pkgver/packaging/$_pkgname.desktop"
  "https://raw.githubusercontent.com/arthurr0/mTerminal/v$pkgver/src-tauri/icons/icon.png"
  "https://raw.githubusercontent.com/arthurr0/mTerminal/v$pkgver/LICENSE"
)
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855' 'a1fe75b856e69edb2dd883279a53ed886e76603e24d0ea638bcc47efe457ca50' '25bb2bf785d51e6a4a075006b97d3742e5ce88b2b7933e871e1834df3785a4b5' '1699e3455f860d7875bb9791ec4f5926348722ca98bb834832a0bacddcbd12d6')

package() {
  install -Dm755 "$_pkgname-$pkgver.AppImage" \
    "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
