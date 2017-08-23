# Maintainer: Terje Larsen <terlar@gmail.com>
pkgname=oni
pkgver=0.2.8
pkgrel=1
pkgdesc='An IDE built around Neovim'
arch=(any)
url="https://github.com/extr0py/oni"
license=('MIT')
depends=('nodejs' 'neovim' 'gconf' 'libxss')
makedepends=('tar')
source=("https://github.com/extr0py/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "oni.sh")
sha256sums=('0d796cbfd036a5f51d8d44f957547730f398518a76d0a32e3cfaab89880885ac'
            '72a945d501f33cfc2fd0d8e832942ba75c09518abd2248973c4df461c3229aee')

package() {
  install -d ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}
  install -Dm755 $srcdir/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
# vim:set ts=2 sw=2 et:
