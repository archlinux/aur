# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: sssslang <xofyarg at gmail dot com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

pkgname=fortune-mod-zh
pkgver=2.7
pkgrel=1
pkgdesc="Chinese poems for fortune-mod"
url="http://packages.qa.debian.org/f/fortune-zh.html"
license=("GPL")
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://ftp.debian.org/debian/pool/main/f/fortune-zh/fortune-zh_${pkgver}.tar.xz)
md5sums=('5d8e2b0aa6ebe5c3b400663601442cec')
arch=('any')

build() {
  cd "${srcdir}/fortune-zh"
  make || return 1
}

package(){
  cd "${srcdir}/fortune-zh"
  mkdir -p "${pkgdir}/usr/share/fortune"
  install -m0644 tang300 "${pkgdir}/usr/share/fortune"
  install -m0644 tang300.dat "${pkgdir}/usr/share/fortune"
  install -m0644 song100 "${pkgdir}/usr/share/fortune"
  install -m0644 song100.dat "${pkgdir}/usr/share/fortune"
  install -m0644 chinese "${pkgdir}/usr/share/fortune"
  install -m0644 chinese.dat "${pkgdir}/usr/share/fortune"
}
