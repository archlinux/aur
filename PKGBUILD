# Maintainer: Zach Himsel <zach [at] himsel [dot] net>

pkgname=kwin-scripts-ultrawide-tiling
_reponame=Kwin-Ultrawide-Tiling
_scriptname=kwin-ultrawide-tiling
pkgdesc="Kwin script to add useful keyboard shortcuts for tiling-like window management"
pkgver=1.0.2
pkgrel=1
arch=('any')
url="https://github.com/zhimsel/${_reponame}"
license=('GPL2')
depends=('kwin')
source=("https://github.com/zhimsel/${_reponame}/archive/${pkgver}.tar.gz")
sha512sums=('451f8c602b86fea57bf8c0cd3bbbadc5b4b2e0db99106def1df4b15387328b910201e55d3ac0ba097380641cece91ffe0a7c81fcfd0eea683519d18e86038470')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_scriptname}"
  cp -r "${srcdir}/${_reponame}-${pkgver}"/{contents,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_scriptname}"
  install -Dm644 "${srcdir}/${_reponame}-${pkgver}"/metadata.desktop "${pkgdir}/usr/share/kservices5/${_scriptname}.desktop"
}
