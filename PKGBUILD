# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='keeex'
pkgver=3.2
pkgrel=1
pkgdesc='Fully operational blockchain solutions for securing, chaining, sharing, signing and timestamping any kind of document, data or process with no alteration.'
arch=('x86_64')
url='https://keeex.me/'
license=('custom')
depends=('hidapi'
         'libxtst'
         'gtk2'
         'nss'
         'alsa-lib'
         'gconf'
         'libnotify')
source=("https://downloads.keeex.io/latest/keeex.linux64.zip"
        "keeex.desktop"
        "LICENSE")
sha512sums=('4a168d2e36aea11cebcae6cffe4df16df0b4af9d2b1bae4b1c2d438353bcb48def57efcac52cbd98198feddbe5547b657aea157038bc3b90f51228c855dcd596'
            'f2f94f81d3616cbbcebfb1355b84c72c6f131f406e2a074119d5eaa2cbc6740f9a251f464d45568698b1d8420751bd2c75b8c64da5fc4d4305849d901a0c5ac7'
            '4c020bd39625488476f7dabaef9a289eff51af00c1b1d6e72c00bc306aadf7109aac4a785e1d56c3b7d2160b2e046e7a7d90e36835f8d12c4baefe0b128021bb')
_execname="KeeeX"

package() {
  cd "${srcdir}/"
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Program
  install -Dm755 "${_execname}" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 "nw.pak" "libffmpegsumo.so" "icudtl.dat" "${pkgdir}/usr/lib/${pkgname}/"

  # Link to program
  ln -s "/usr/lib/${pkgname}/${_execname}" "${pkgdir}/usr/bin/${_execname}"

  # Desktop file
  install -Dm644 "keeex.desktop" "${pkgdir}/usr/share/applications/keeex.desktop"

  # Copy license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
