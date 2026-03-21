# Maintainer: Sergey Elpashev <mrsedan at nwaifu dot su>
pkgname=smokeinstaller
_pkgname=smokeapi-installer
pkgver=1.0.0
pkgrel=2
pkgdesc='CLI installer for SmokeAPI'
arch=('any')
url='https://git.nwaifu.su/neuro_llc/SmokeAPI-Installer'
license=('MIT')
depends=('python')
install="${pkgname}.install"
source=(
  "smokeinstaller-${pkgver}-${pkgrel}-any.tar.gz::https://git.nwaifu.su/neuro_llc/SmokeAPI-Installer/archive/v${pkgver}.tar.gz"
  "https://git.nwaifu.su/neuro_llc/SmokeAPI-Installer/raw/branch/master/LICENSE.txt"
  "https://git.nwaifu.su/neuro_llc/SmokeAPI-Installer/raw/branch/master/smokeinstaller.1"
)
sha256sums=('bddf4bee86d5a78de9cad1f4c784340c1df242a2837b6f0d2277df576ca1734b'
  'a65614fece440bd93dfdb2850ecb5ea6ef4ec34df7550907f9b0b05cf2c05aec'
  'd454121cb2ff0c2c4e0c1b0e0ccd65bee348310dcd3c8fa526dba93ad3e0b03f')

package() {
  install -Dm755 "$srcdir/${_pkgname}/installer.py" "$pkgdir/usr/bin/smokeinstaller"
  install -Dm644 "$srcdir/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/smokeinstaller.1" "$pkgdir/usr/share/man/man1/smokeinstaller.1"
}
