# Maintainer: workonfire <kolucki62@gmail.com>

pkgname=gadu-gadu
pkgver=12.4.112.12218
pkgrel=1
pkgdesc="A Polish instant messaging client using a proprietary protocol."
arch=('i686' 'x86_64')
url="https://gg.pl"
license=('custom')
depends=('gtk2' 'alsa-lib' 'dbus-glib' 'libxt')
source=("${pkgname}".desktop
        "${pkgname}")
source_x86_64=(gg_64bit_"${pkgver}".tar.bz2::http://im-updates.gg.pl/phoenix/app/release/"${pkgver}"/standard/Linux_x86_64-gcc3/pl/gg_64bit.tar.bz2)
source_i686=(gg_32bit_"${pkgver}".tar.bz2::http://im-updates.gg.pl/phoenix/app/release/"${pkgver}"/standard/Linux_x86-gcc3/pl/gg_32bit.tar.bz2)
sha256sums=('8137b434801ad2f7a2a6ec5bf731e41dd381839ce55dca4082634764cea53c78'
            'cfc55261aacbb25bdf65b3a05875cf106e1e1877b220c39ede863ee6a9631b7c')
sha256sums_i686=('ccb7d787ab7a945c215743fb32aa46d296aeb5fc80faea282a91001a1b06c7bd')
sha256sums_x86_64=('ee72bf140a4e36b3ab9b90f9874bae88f32313ed62555cb203af5c1e28e754cd')
options=(!strip)

package() {
  mkdir -p "${pkgdir}"/opt
  cp -r "${srcdir}"/GG "${pkgdir}"/opt/
  install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 "${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop
}
