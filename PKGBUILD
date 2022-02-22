# Maintainer: fabon <syobon.hinata.public[at]gmail[dot]com>
pkgname=hgrep-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Grep with human-friendly search results"
arch=('x86_64')
url="https://github.com/rhysd/hgrep"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('zip')

source=("hgrep.zip::https://github.com/rhysd/hgrep/releases/download/v${pkgver}/hgrep-v${pkgver}-x86_64-unknown-linux-gnu.zip")
noextract=('hgrep.zip')
md5sums=('ba68a83dd4e20acc5d4a4621e962511d')

prepare() {
  unzip hgrep.zip
  mv hgrep*/hgrep .
  mv hgrep*/LICENSE.txt .
  rm hgrep.zip
  rm -r hgrep-*
}

package() {
  chmod +x "${srcdir}/hgrep"
  install -Dm755 "${srcdir}/hgrep" "${pkgdir}/usr/bin/hgrep"
  install -Dm755 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
