# Maintainer: Yiqiao Wang <yiqiao.wang96 at gmail dot com>
# Contributor: wenLiangcan <boxeed at gmail dot com>
pkgname=ammonite
pkgver=2.0.4
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
b2sums=('3880d6409bf5bdcb35afa504a8d904e02ef2de8216b979ebe341e156e57aa305418fdaaf9f0d5eef3d44de3a78d8a372474298a91f9e00a53820eaf57704ad30'
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
