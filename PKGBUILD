# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: sssslang <xofyarg at gmail dot com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

pkgname=fortune-mod-zh
pkgver=2.98
pkgrel=1
pkgdesc="Chinese poems for fortune-mod"
url="https://salsa.debian.org/chinese-team/fortunes-zh"
license=("GPL")
depends=('fortune-mod')
groups=('fortune-mods')
source=(https://salsa.debian.org/chinese-team/fortunes-zh/-/archive/debian/${pkgver}/fortunes-zh-debian-${pkgver}.tar.gz)
md5sums=('ce11ddc5ff37020b75544d3b518d743b')
arch=('any')

build() {
  cd "${srcdir}/fortunes-zh-debian-${pkgver}"
  make chinese.dat
  make song100.dat
  make tang300.dat || return 1
}

package(){
  cd "${srcdir}/fortunes-zh-debian-${pkgver}"


  mkdir -p "${pkgdir}/usr/share/fortune"
  install -m0644 tang300 "${pkgdir}/usr/share/fortune"
  install -m0644 tang300.dat "${pkgdir}/usr/share/fortune"
  install -m0644 song100 "${pkgdir}/usr/share/fortune"
  install -m0644 song100.dat "${pkgdir}/usr/share/fortune"
  install -m0644 chinese "${pkgdir}/usr/share/fortune"
  install -m0644 chinese.dat "${pkgdir}/usr/share/fortune"
}
