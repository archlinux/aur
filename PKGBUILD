# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: sssslang <xofyarg at gmail dot com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

pkgname=fortune-mod-zh
pkgver=2.8
pkgrel=1
pkgdesc="Chinese poems for fortune-mod"
url="https://salsa.debian.org/chinese-team/fortunes-zh"
license=("GPL")
depends=('fortune-mod')
groups=('fortune-mods')
source=(https://salsa.debian.org/chinese-team/fortunes-zh/-/archive/${pkgver}/fortunes-zh-${pkgver}.tar.gz)
md5sums=('3fff0e8cb73285ce76febdbafc7dee4a')
arch=('any')

build() {
  cd "${srcdir}/fortunes-zh-${pkgver}"
  make || return 1
}

package(){
  cd "${srcdir}/fortunes-zh-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/fortune"
  install -m0644 tang300 "${pkgdir}/usr/share/fortune"
  install -m0644 tang300.dat "${pkgdir}/usr/share/fortune"
  install -m0644 song100 "${pkgdir}/usr/share/fortune"
  install -m0644 song100.dat "${pkgdir}/usr/share/fortune"
  install -m0644 chinese "${pkgdir}/usr/share/fortune"
  install -m0644 chinese.dat "${pkgdir}/usr/share/fortune"
}
