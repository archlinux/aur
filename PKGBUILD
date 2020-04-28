# Maintainer: Thayne <astrothayne at gmail dot com>
# Contributor: Yiqiao Wang <yiqiao.wang96 at gmail dot com>
# Contributor: wenLiangcan <boxeed at gmail dot com>
pkgname=ammonite
pkgver=2.1.1
pkgrel=1
pkgdesc="A cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('MIT')
_scalaver=2.13
depends=("scala>=${_scalaver}" java-environment)
source=("ammonite-repl-${pkgver}"::"https://github.com/lihaoyi/Ammonite/releases/download/${pkgver}/${_scalaver}-${pkgver}"
        "https://github.com/lihaoyi/Ammonite/raw/${pkgver}/LICENSE")
noextract=("ammonite-repl-${pkgver}")
b2sums=('3f800ec46fae343fa2978ff3ec5b2055917580d525842b8d3fe4830c72d85f98e447cac62077c3d06be5c35382990aa6899f82ffa35ad2cdd993d0b39277ade4'
        'fc9694ff702a7c919b82c3429911dd0f4bf83ee36e7036bf5d82b62f3a1bc0dfb2bb80313ef89fa80353a7cf202bced4d942de25fdda789258753cd42633752d')
install="${pkgname}.install"

prepare() {
  echo '#!/bin/sh' > "$srcdir/amm"
  cat "ammonite-repl-${pkgver}" >> "$srcdir/amm"
}

package() {
    install -Dm755 "$srcdir/amm" "${pkgdir}/usr/bin/amm"
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
