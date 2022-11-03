# Maintainer: Zach Himsel <zach [at] himsel [dot] net>

pkgname=kwin-scripts-ultrawide-tiling
_reponame=Kwin-Ultrawide-Tiling
_scriptname=kwin-ultrawide-tiling
pkgdesc="Kwin script to add useful keyboard shortcuts for tiling-like window management"
pkgver=1.1.1
pkgrel=1
arch=('any')
url="https://github.com/zhimsel/${_reponame}"
license=('GPL2')
depends=('kwin')
source=("https://github.com/zhimsel/${_reponame}/archive/${pkgver}.tar.gz")
sha512sums=('915e67fe5faacb208a85435e2cd4174f843989e87714dafb2e4e5779d51b512750eefcb32e807430cb3aaaf7586a7fa41d48de98199449dc1a73ca28fac5d5e8')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_scriptname}"
  cp -r "${srcdir}/${_reponame}-${pkgver}"/{contents,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_scriptname}"
  install -Dm644 "${srcdir}/${_reponame}-${pkgver}"/metadata.desktop "${pkgdir}/usr/share/kservices5/${_scriptname}.desktop"
}
