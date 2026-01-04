# Maintainer: Pablo Lezaeta <prflr88 (arro'a) gmail puntocom>

pkgname=mintcommon
pkgver=2.4.9
pkgrel=1
pkgdesc="Common Python modules and utilities for Linux Mint tools"
arch=('any')
url="https://github.com/linuxmint/mintcommon"
license=('GPL-3.0')
depends=('python')
makedepends=('git')
source=("${pkgname}::git+https://github.com/linuxmint/${pkgname}.git#commit=ec304f3422aabf84a69141d36e95a3eb55b300f7")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  
  # Install the estructure of usr/
  mkdir --verbose -p  "${pkgdir}/usr"
  cp --verbose -r usr/* "${pkgdir}/usr/"
  mv --verbose "${pkgdir}/usr/lib/python3" "${pkgdir}/usr/lib/python3.13"

  
  # Install the aditionals
  install -d -m 0755 "${pkgdir}/etc"
  cp --verbose -r -p etc/* "${pkgdir}/etc/"
  install -d -m 0750 -o root -g 102 "${pkgdir}/etc/polkit-1/rules.d"
}
