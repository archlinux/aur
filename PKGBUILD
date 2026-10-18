# Maintainer: lostmason <lostmason@tutamail.com>

pkgname=ttf-rysana
pkgver=1.0.0
pkgrel=1
pkgdesc='Rysana Sans and Rysana Mono typefaces'
arch=('any')
url='https://rysana.com/type'
license=('OFL-1.1-RFN')
provides=('ttf-font')
source=("$pkgname-$pkgver.zip::https://github.com/rysana-os/type/releases/download/v$pkgver/rysana-type.zip")
sha256sums=('4888f504a9b4c13f12cea08112c3e463c6879ba439d4790216842ce8e0b35812')
b2sums=('a264386b2974853982ad57b214c19a15ffb2b065950f623c73f3dac42e2d98d193d8780113db396020b8bb885083d2aa63e33af60985c01f127b801fca4b67f2')

package() {
  cd rysana-type

  # Hinted static fonts render better on Linux at 96 dpi; the variable fonts
  # use separate family names ("Rysana Sans Variable"), so both can coexist.
  install -Dm644 -t "$pkgdir/usr/share/fonts/rysana" ttf-hinted/*.ttf variable/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
