# Maintainer: workonfire <kolucki62@gmail.com>

pkgname=gadu-gadu
pkgver=12.4.106.12187
pkgrel=1
pkgdesc="A Polish instant messaging client using a proprietary protocol."
arch=('i686' 'x86_64')
url="https://gg.pl"
license=('custom')
depends=('gtk2' 'alsa-lib' 'dbus-glib' 'libxt')
source=("${pkgname}".desktop::https://raw.githubusercontent.com/workonfire/PKGBUILDs/master/"${pkgname}"/"${pkgname}".desktop
        "${pkgname}"::https://raw.githubusercontent.com/workonfire/PKGBUILDs/master/"${pkgname}"/"${pkgname}")
source_x86_64=(gg_64bit_"${pkgver}".tar.bz2::http://im-updates.gg.pl/phoenix/app/release/"${pkgver}"/standard/Linux_x86_64-gcc3/pl/gg_64bit.tar.bz2)
source_i686=(gg_32bit_"${pkgver}".tar.bz2::http://im-updates.gg.pl/phoenix/app/release/"${pkgver}"/standard/Linux_x86-gcc3/pl/gg_32bit.tar.bz2)
sha256sums=('8137b434801ad2f7a2a6ec5bf731e41dd381839ce55dca4082634764cea53c78'
            'cfc55261aacbb25bdf65b3a05875cf106e1e1877b220c39ede863ee6a9631b7c')
sha256sums_i686=('aae18db232fa4f5b64c7ecd5208b75762e6a905463ed353d54d742d13e068a7e')
sha256sums_x86_64=('853882c90bb5f9c4118cb2a62846218b5a869f6708f2f446d47180fc77661f73')
options=(!strip)

package() {
  mkdir -p "${pkgdir}"/opt
  cp -r "${srcdir}"/GG "${pkgdir}"/opt/
  install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 "${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop
}
