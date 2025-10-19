pkgname=android4-screen-control
pkgver=1.0
pkgrel=1
pkgdesc="GUI tool to control Android 4.x devices (scrcpy alternative for old Android)"
arch=('any')
url="https://github.com/shinichiroisumi/android4-screen-control"
license=('MIT')
depends=('python' 'python-pillow' 'tk' 'android-tools')
source=("$pkgname.py::https://github.com/shinichiroisumi/android4-screen-control/blob/main/index.py"
        "LICENSE::https://github.com/shinichiroisumi/android4-screen-control/blob/main/LICENSE"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  if [[ -f "$pkgname.desktop" ]]; then
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  fi
}