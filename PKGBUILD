# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=no-power-privileges-multisession
pkgver=1.0
pkgrel=2
pkgdesc='Polkit rule to prevent users from touching system power state when there are multiple sessions, unless they are in the `power` group'
arch=("any")
url="https://aur.archlinux.org/packages/no-power-privileges-multisession"
depends=("polkit")
conflicts=("no-power-privileges")

license=("MIT")
install="${pkgname}.install"
source=(
  "20-no-power-privileges-multisession.rules"
  "LICENSE"
)
sha512sums=('c115a02554718ce83e09c9f4c850b6d338a9530cdd8a9d63bb5ef70fcd5a1f8b0f8bb8e42b12acfb99d58f3b363b47289ebccfd1ea4a0608b0df2cad51354ab3'
            'c99f1ab3ab4707199a0e767c065d10119b188e1a5a5100160ceaea753a3cc24342286606eb10d3b5dc251051f7ef922ed679823d5ca9109334d8dd9fc4dcd0be')

package() {
  cd ${srcdir}
  install -Dm750 -d "${pkgdir}/usr/share/polkit-1/rules.d"
  install -Dm644 -t "${pkgdir}/usr/share/polkit-1/rules.d" 20-no-power-privileges-multisession.rules
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
