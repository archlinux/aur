# Maintainer: Vitor S Rodrigues <vitor.rodrigues@gmail.com>
pkgname=brother-dcp-l8400cdn
pkgver=1.1.2
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP-L8400CDN"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux"
license=('GPL2' 'custom:Brother EULA')
depends=('cups')
depends_x86_64=('lib32-glibc')
source=("http://download.brother.com/welcome/dlf101078/dcpl8400cdnlpr-1.1.2-1.i386.rpm"
        "http://download.brother.com/welcome/dlf101079/dcpl8400cdncupswrapper-1.1.3-1.i386.rpm")
sha512sums=('b2c97b291a07fe0f5a2590df59599fc7bb9b12b9d158afa7ad57fd083556529c637ee7dacf0792004499aced8373514b81a19bcfea7d36a3dbf5387cd080bd09'
            '5d027a1e46a5cddb815c8a5b2c6b0130b664e9a0ae25e38c7b0f0a9630c41f872895377efee6a73a5d1f45025c55c5bcee347aa329b8b0ec32ad2831a1efe4b5')

package() {
  install -Dm755 ${srcdir}/usr/bin/brprintconf_dcpl8400cdn ${pkgdir}/usr/bin/brprintconf_dcpl8400cdn
  cp -r ${srcdir}/opt ${pkgdir}/opt

  install -Dm644 \
    ${srcdir}/opt/brother/Printers/dcpl8400cdn/cupswrapper/brother_dcpl8400cdn_printer_en.ppd \
    ${pkgdir}/usr/share/cups/model/brother_dcpl8450cdw_printer_en

  install -Dm755 \
    ${srcdir}/opt/brother/Printers/dcpl8400cdn/cupswrapper/cupswrapperdcpl8400cdn \
    ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_dcpl8400cdn
}