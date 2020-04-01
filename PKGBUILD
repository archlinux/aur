# Maintainer: Zach Himsel <zach [at] himsel [dot] net>

pkgname=kwin-scripts-ultrawide-tiling
_reponame=Kwin-Ultrawide-Tiling
_scriptname=kwin-ultrawide-tiling
pkgdesc="Kwin script to add useful keyboard shortcuts for tiling-like window management"
pkgver=1.0.0
pkgrel=1
arch=('any')
url="https://github.com/zhimsel/${_reponame}"
license=('GPL2')
depends=('kwin')
source=("https://github.com/zhimsel/${_reponame}/archive/${pkgver}.tar.gz")
sha512sums=('7d0df83555ea189043a6e580f4fadd0802434e9ed124d772ca0063b8452ce093a1fe17629b9375cd3fb9bf20604b100097d8aca0bba712466883da7145ec3b7d')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_scriptname}"
  cp -r "${srcdir}/${_reponame}-${pkgver}"/{contents,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_scriptname}"
  install -Dm644 "${srcdir}/${_reponame}-${pkgver}"/metadata.desktop "${pkgdir}/usr/share/kservices5/${_scriptname}.desktop"
}
