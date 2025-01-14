# Maintainer: LJ <aur.lj at munally.com>

pkgname=servoshell-bin
_pkgname=servo
pkgver=2025.01.14
pkgrel=1
pkgdesc="These pre-built nightly snapshots allow developers to try Servo and report issues without building Servo locally."
arch=('x86_64')
url="https://github.com/versotile-org/$_pkgname"
license=('MPL-2.0')
source=(
  "https://download.servo.org/nightly/linux/servo-latest.tar.gz"
  "servoshell.desktop"
)
sha256sums=(
  "339cb1a190f41913398ff28f50b48847142dad069ecfd3189f983436bcfa5724"
  "5bf7a51a34df54ce99776ee01e796e086b85d5b7575193ed0c5586d046929e88"  
)

package() {
  install -Dm644 "servoshell.desktop" "$pkgdir/usr/share/applications/servoshell.desktop"
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/servo-latest.tar.gz"
  mkdir -p "${pkgdir}/opt/servoshell"
  mv "servo/"* "$pkgdir/opt/servoshell"
  rm -r servo
}
