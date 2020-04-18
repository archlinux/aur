# Maintainer: Zach Himsel <zach [at] himsel [dot] net>

pkgname=kwin-scripts-ultrawide-tiling
_reponame=Kwin-Ultrawide-Tiling
_scriptname=kwin-ultrawide-tiling
pkgdesc="Kwin script to add useful keyboard shortcuts for tiling-like window management"
pkgver=1.0.1
pkgrel=2
arch=('any')
url="https://github.com/zhimsel/${_reponame}"
license=('GPL2')
depends=('kwin')
source=("https://github.com/zhimsel/${_reponame}/archive/${pkgver}.tar.gz")
sha512sums=(' 54990915dd06d629321c8834a0be6c78a6bcba5c95c8cf7a05ddc404151ae53f1d26d93110f6afc9bc9d10d86218699f665c70087a3ac11f58394662e76713f5')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_scriptname}"
  cp -r "${srcdir}/${_reponame}-${pkgver}"/{contents,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_scriptname}"
  install -Dm644 "${srcdir}/${_reponame}-${pkgver}"/metadata.desktop "${pkgdir}/usr/share/kservices5/${_scriptname}.desktop"
}
