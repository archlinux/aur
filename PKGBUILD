# Maintainer: Gyara <laxect39@gmail.com>

pkgname=yaneuraou-nnue-avx2
pkgver=7.61
pkgrel=1
pkgdesc="YaneuraOu is the World's Strongest Shogi engine(AI player) , WCSC29 1st winner , educational and USI compliant engine."
arch=('any')
url="https://github.com/yaneurao/YaneuraOu"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/V${pkgver//_/-}.tar.gz")
sha512sums=('9e4c8c924b4eb8219861629668371c7de343513b52550c6afd2c0443a4c321b9c95651a9c734befa6bc7108fc4e8d559c179dc3b35ffe5bd0a700dd8d9bd076d')

build() {
    cd "${srcdir}/YaneuraOu-${pkgver}/source"
    make tournament TARGET_CPU=AVX2 COMPILER=g++ YANEURAOU_EDITION=YANEURAOU_ENGINE_NNUE
}

package() {
    cd "${srcdir}/YaneuraOu-${pkgver}"
    install -Dm755 "source/YaneuraOu-by-gcc" "$pkgdir/usr/bin/yaneuraou-nnue-avx2"
    install -Dm644 "Copying.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
