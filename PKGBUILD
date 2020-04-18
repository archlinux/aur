# Maintainer: Zach Himsel <zach [at] himsel [dot] net>

pkgname=kwin-scripts-ultrawide-tiling
_reponame=Kwin-Ultrawide-Tiling
_scriptname=kwin-ultrawide-tiling
pkgdesc="Kwin script to add useful keyboard shortcuts for tiling-like window management"
pkgver=1.0.1
pkgrel=3
arch=('any')
url="https://github.com/zhimsel/${_reponame}"
license=('GPL2')
depends=('kwin')
source=("https://github.com/zhimsel/${_reponame}/archive/${pkgver}.tar.gz")
sha512sums=('d88ac10df127e685373b060db41b0e153b98620bef1e2cd3223171eac41e629b596502ce152912bee9cfe810142f54c952c1cae7234783d6ae4b28dd3451c3b4')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_scriptname}"
  cp -r "${srcdir}/${_reponame}-${pkgver}"/{contents,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_scriptname}"
  install -Dm644 "${srcdir}/${_reponame}-${pkgver}"/metadata.desktop "${pkgdir}/usr/share/kservices5/${_scriptname}.desktop"
}
