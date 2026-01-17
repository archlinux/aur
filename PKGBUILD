# Maintainer: Pablo Lezaeta <prflr88 (arro'a) gmail puntocom>

pkgname=mintcommon
pkgver=2.5.0
pkgrel=1
pkgdesc="Common Python modules and utilities for Linux Mint tools"
arch=('any')
url="https://github.com/linuxmint/mintcommon"
license=('GPL-3.0')
depends=('python')
makedepends=('git')
source=("${pkgname}::git+https://github.com/linuxmint/${pkgname}.git#commit=21c4ea8fc6c13a57eba3b7323c2d6d15b52e7f0b")
sha256sums=('a2feeecd99621c3cd023b7b51d435a84bf085a802823d74c97eb5349755425a8')

package() {
  cd "${srcdir}/${pkgname}"
  
  # Install the estructure of usr/
  mkdir --verbose -p  "${pkgdir}/usr"
  cp --verbose -r usr/* "${pkgdir}/usr/"
  mv --verbose "${pkgdir}/usr/lib/python3" "${pkgdir}/usr/lib/python3.14"

  
  # Install the aditionals
  install -d -m 0755 "${pkgdir}/etc"
  cp --verbose -r -p etc/* "${pkgdir}/etc/"
  install -d -m 0750 -o root -g 102 "${pkgdir}/etc/polkit-1/rules.d"
}
