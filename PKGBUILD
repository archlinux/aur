# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=no-power-privileges
pkgver=1.1
pkgrel=3
pkgdesc='Polkit rule to prevent users from touching system power state unless they are in the `power` group'
arch=("any")
url="https://aur.archlinux.org/packages/no-power-privileges"
depends=("polkit")
conflicts=("no-power-privileges-multisession")

license=("MIT")
install="${pkgname}.install"
source=(
  "20-no-power-privileges.rules"
  "LICENSE"
)
sha512sums=('cf295103f74c9ec4d6f18a4f855b909f6b98d2fe7ed16bc0b6f0ac07b02e7150d46bcc8284877a9c78cddb1da97ee4c2ed15a7044a760962d7c3f9ece4822b19'
            'c99f1ab3ab4707199a0e767c065d10119b188e1a5a5100160ceaea753a3cc24342286606eb10d3b5dc251051f7ef922ed679823d5ca9109334d8dd9fc4dcd0be')

package() {
  cd ${srcdir}
  install -Dm750 -d "${pkgdir}/usr/share/polkit-1/rules.d"
  install -Dm644 -t "${pkgdir}/usr/share/polkit-1/rules.d" 20-no-power-privileges.rules
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
