# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgbase=ttf-sinkin-sans-ibx
pkgname=('otf-sinkin-sans-ibx' 'ttf-sinkin-sans-ibx')
pkgver=1.1
pkgrel=6
depends=('fontconfig')
pkgdesc="A simple, pleasant, luxuriously proportioned and easy to read sans-serif"
url="http://www.k-type.com/"
arch=('any')
groups=('infinality-bundle-fonts-extra')
license=('Apache')
source=(http://www.k-type.com/freefonts/SINKIN_SANS_FAMILY.zip
        45-sinkin-sans.conf
        90-non-tt-sinkin-sans.conf
        90-tt-sinkin-sans.conf)
sha1sums=('e95495df31674a2bcb7622dd7a7050f0e8a94aed'
          '974fa6222711f8788db6a8511239fb6ce2cb6caf'
          'fc8ccb8b451b1d0fa9e8bb28abaf68c63270aac4'
          '11e853e02e468b4a54a9dff32d3a57e095c44b68')

package_otf-sinkin-sans-ibx(){
  pkgdesc="Sinkin Sans is a simple, pleasant, luxuriously proportioned and easy to read sans-serif. OTF version."
  conflicts=('ttf-sinkin-sans-ibx')

  cd "${srcdir}"/"SINKIN SANS FAMILY"/OTF

  install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 ../SinkinSans_NOTICE.txt \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 "${srcdir}"/45-sinkin-sans.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-sinkin-sans.conf
  install -m644 "${srcdir}"/90-non-tt-sinkin-sans.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-non-tt-sinkin-sans.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-sinkin-sans.conf .
  ln -s ../conf.avail/90-non-tt-sinkin-sans.conf .
}

package_ttf-sinkin-sans-ibx(){
  pkgdesc="Sinkin Sans is a simple, pleasant, luxuriously proportioned and easy to read sans-serif. TTF version."
  conflicts=('otf-sinkin-sans-ibx')

  cd "${srcdir}"/"SINKIN SANS FAMILY"

  install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 SinkinSans_NOTICE.txt \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 "${srcdir}"/45-sinkin-sans.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-sinkin-sans.conf
  install -m644 "${srcdir}"/90-tt-sinkin-sans.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-sinkin-sans.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-sinkin-sans.conf .
  ln -s ../conf.avail/90-tt-sinkin-sans.conf .
}
