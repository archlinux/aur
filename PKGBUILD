# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=freedit-bin
pkgver=0.9.9
pkgrel=1
pkgdesc="Lightweight, safe forum software"
arch=('x86_64')
url="https://github.com/freedit-org/freedit"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/freedit-org/freedit/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/freedit-v${pkgver}-x86_64-unknown-linux-gnu.zip")
sha256sums=('53a3e4a4763dda1af6daf85968a8c1e7e2d1e5e5ae4104e3dcc895b3a088673a')
sha256sums_x86_64=('35c6405f188167261fd727ceefb6d5472ff2c9527cd952b31edfa72251748148')

package() {
  install -Dm755 "freedit" "${pkgdir}/usr/bin/freedit"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
