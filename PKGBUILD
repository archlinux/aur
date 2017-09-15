# Maintainer: Terje Larsen <terlar@gmail.com>
pkgname=oni
pkgver=0.2.9
pkgrel=1
pkgdesc='An IDE built around Neovim'
arch=(any)
url="https://github.com/extr0py/oni"
license=('MIT')
depends=('nodejs' 'neovim-git' 'gconf' 'libxss')
makedepends=('tar')
source=("https://github.com/extr0py/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux.tar.gz"
        "oni.sh")
sha256sums=('839eb3e1034d538f005bfac35865e98f25d57dbe7b4139075f868ccea24cd15f'
            '72a945d501f33cfc2fd0d8e832942ba75c09518abd2248973c4df461c3229aee')

package() {
  install -d ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/Oni-${pkgver}-linux/* ${pkgdir}/opt/${pkgname}
  install -Dm755 $srcdir/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
# vim:set ts=2 sw=2 et:
