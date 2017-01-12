# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: Maxence Mohr <maxence@keeex.net>

pkgname='keeex'
pkgver=3.2
pkgrel=3
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
        "https://keeex.me/pkgfiles/icon.png"
        "keeex.desktop"
        "https://keeex.me/pkgfiles/LICENSE")
sha512sums=('4a168d2e36aea11cebcae6cffe4df16df0b4af9d2b1bae4b1c2d438353bcb48def57efcac52cbd98198feddbe5547b657aea157038bc3b90f51228c855dcd596'
            'a0dd5edb226531602db1e5796327f0674fcc944ab4868e1b96d9028f6c6756b08cb71654cac6249f87700427a4c9057c1f36389b53055ca3714628a2930f6da7'
            'c33b17e4ea2952d0bdf5f09fb8d97674de2d38401813a404a49a69b9800045eeb0cf8afc6c06ea59f5eb9696fc341d98dae94b4263aa4a836c8fb2e5426402ad'
            'ed5e531303fefc75b839a5778fd4e83166d0263bc1aa68672919dee013eda391b61b34600c580ed7ab5f94e70523ce64e0679bac18dc25a25230c032b00d5b56')
_execname="KeeeX"
_target_dir="/opt"
options=("!strip")

package() {
  cd "${srcdir}/"
  install -dm755 "${pkgdir}${_target_dir}/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Program
  install -Dm755 "${_execname}" "${pkgdir}${_target_dir}/${pkgname}/"
  install -Dm644 "icon.png" "nw.pak" "libffmpegsumo.so" "icudtl.dat" "${pkgdir}${_target_dir}/${pkgname}/"

  # Link to program
  ln -s "${_target_dir}/${pkgname}/${_execname}" "${pkgdir}/usr/bin/${_execname,,}"

  # Desktop file
  install -Dm644 "keeex.desktop" "${pkgdir}/usr/share/applications/keeex.desktop"

  # Copy license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
