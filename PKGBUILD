# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=rememberthemilk
pkgver=1.1.9
pkgrel=2
pkgdesc="The smart to-do app for busy people."
arch=('x86_64')
url="https://www.rememberthemilk.com"
license=('custom:none' 'MIT' 'Apache')
source=("https://www.rememberthemilk.com/download/linux/debian/pool/main/r/rememberthemilk/rememberthemilk_${pkgver}_amd64.deb")
sha256sums=('0a3902f8c6407fa396e8a6061db16292605919b00278cc95fe45365616f0cf66')
depends=('gconf' 'gtk2' 'gtk3' 'nss')

prepare() {
  cd ${srcdir}
  bsdtar -xf data.tar.xz
}

package() {
  cp -r ${srcdir}/opt ${pkgdir}
  cp -r ${srcdir}/usr ${pkgdir}
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/opt/Remember The Milk"/LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
