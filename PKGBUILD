# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: sssslang <xofyarg at gmail dot com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

pkgname=fortune-mod-zh
pkgver=1.11
pkgrel=1
pkgdesc="Chinese poems for fortune-mod"
url="http://packages.qa.debian.org/f/fortune-zh.html"
license=("GPL")
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://ftp.debian.org/debian/pool/main/f/fortune-zh/fortune-zh_${pkgver}.tar.xz)
md5sums=('c3ca800b76ef75d6d234e9fbf9e1a44f')
arch=('any')

build() {
  cd "${srcdir}/fortune-zh-${pkgver}"
  make || return 1
}

package(){
  cd "${srcdir}/fortune-zh-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/fortune"
  install -m0644 tang300 "${pkgdir}/usr/share/fortune"
  install -m0644 tang300.dat "${pkgdir}/usr/share/fortune"
  install -m0644 song100 "${pkgdir}/usr/share/fortune"
  install -m0644 song100.dat "${pkgdir}/usr/share/fortune"
}
