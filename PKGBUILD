# Maintainer: Alexander Daum <alexander.daum at mailbox dot org>

pkgname='coco_r_cpp'
pkgver=2018_12_03
pkgrel=2
pkgdesc='Coco/R Compiler Generator (C++ version)'
url='https://ssw.jku.at/Research/Projects/Coco/'
license=(
 'custom'
)
source=(
 "https://ssw.jku.at/Research/Projects/Coco/CPP/CocoSourcesCPP.zip"
 "https://ssw.jku.at/Research/Projects/Coco/Doc/license.txt"
)
sha512sums=(
 '97baa9ac9888785562d1e2bd56fb433a3abdc037b9ea05382c7a85f1d3bb9f3da0a120e9bac2798da84207ebd66590b9ab08db57c2df4ed4968ac2a200285003'
 '9eaa22aa4a7404285e1c93ece5e4439b3c9a53c7e86a084063b299f373090c1e1e1800b82fc49c131e34d37665e5161d560bd65a496d12d1b944d4b0ed6212bf'
)
arch=(
 'x86_64'
 'i686'
)

build() {
    make
}

package() {
    install -D -m 0755 Coco ${pkgdir}/usr/bin/cococpp
    install -d ${pkgdir}/usr/share/coco-cpp/
    install -m 0644 *frame ${pkgdir}/usr/share/coco-cpp/
    install -Dm644 'license.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
