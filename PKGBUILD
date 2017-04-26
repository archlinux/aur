# Maintainer: Terje Larsen <terlar@gmail.com>
pkgname=oni
pkgver=0.2.2
pkgrel=1
pkgdesc='NeoVim front-end UI focused on IDE-like extensibility'
arch=(any)
url="https://www.npmjs.com/package/$pkgname"
license=('MIT')
depends=('nodejs' 'neovim')
makedepends=('tar')
source=("https://github.com/extr0py/${pkgname}/releases/download/v${pkgver}-recovery/${pkgname}-${pkgver}.tar.gz"
        "oni.sh")
sha256sums=('aea0eae52bdc85aee77dab3f17c5cac243fb87d8f75939586afb7c2b7333f37c'
            '72a945d501f33cfc2fd0d8e832942ba75c09518abd2248973c4df461c3229aee')

package() {
  install -d ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}
  install -Dm755 $srcdir/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
# vim:set ts=2 sw=2 et:
