# Maintainer: arthurr0 <koeckiartur@gmail.com>
pkgname=mterminal-bin
_pkgname=mterminal
pkgver=0.1.0
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
sha256sums=('7c13cb32b9b97fdba78cd01358ef25c67b4c0dfddd82ca8c22e962ffa5fe4e89' 'ce584f217c3d7bd5b34248ba2587fe91f5e92ccf973e9877afeab0ec8fba57f2' 'd513c9acb0f7b49ab7bed67289653b309cb95568d5c1801204e1a0178a7cf73a' '1699e3455f860d7875bb9791ec4f5926348722ca98bb834832a0bacddcbd12d6')

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
