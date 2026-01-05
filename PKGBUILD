# Maintainer: Ivan Puntiy <ivan.puntiy at gmail>
# Contributor: <francois.archlinux.org>

pkgname=culmus
pkgver=0.140
pkgrel=1
pkgdesc="A collection of Type1 and TrueType Hebrew fonts"
arch=('any')
url="http://culmus.sourceforge.net"
license=('GPL2')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6daed104481007752a76905000e71c0093c591c8ef3017d1b18222c277fc52e3')


package() {
  # install Type1 fonts
  install -m755 -d "${pkgdir}/usr/share/fonts/Type1"
  #install -m644 "${srcdir}/culmus-${pkgver}/"*.{afm,pfa} \
  #  "${pkgdir}/usr/share/fonts/Type1"

  # install ttf fonts
  install -m755 -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "${srcdir}/culmus-${pkgver}/"*.ttf \
    "${pkgdir}/usr/share/fonts/TTF"

  # install otf fonts
  install -m755 -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 "${srcdir}/culmus-${pkgver}/"*.otf \
    "${pkgdir}/usr/share/fonts/OTF"

  # install provided config file with priority 61
  install -m755 -d "${pkgdir}/etc/fonts/conf.avail/"
  install -m644 "${srcdir}/culmus-${pkgver}/culmus.conf" \
    "${pkgdir}/etc/fonts/conf.avail/61-culmus.conf"

  # symlink for the abovementioned config file
  install -m755 -d "${pkgdir}/etc/fonts/conf.d"
  ln -fs "../conf.avail/61-culmus.conf" "${pkgdir}/etc/fonts/conf.d/"
}
