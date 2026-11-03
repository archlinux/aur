# Maintainer: Jbsco <https://github.com/Jbsco>
pkgname=blockcodec-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Lossless audio codec with a SPARK-proved block decoder, per-block CRCs and fast seeking'
arch=('x86_64')
url='https://github.com/Jbsco/codec-study'
license=('MIT' 'CC-BY-4.0')
depends=('glibc')
provides=('blockcodec')
conflicts=('blockcodec')
source=("blockcodec-${pkgver}.tar.gz::https://github.com/Jbsco/codec-study/releases/download/v${pkgver}/blockcodec-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('aaffc189533d2862b0b7def49d31b3c7669b728b690b82fa37e8b110d6018e8f')

package() {
    cd "${srcdir}/blockcodec-v${pkgver}"
    install -Dm755 bin/blkc-encode "${pkgdir}/usr/bin/blkc-encode"
    install -Dm755 bin/blkc-decode "${pkgdir}/usr/bin/blkc-decode"
    install -Dm755 lib/libblockcodec.so "${pkgdir}/usr/lib/libblockcodec.so"
    install -Dm644 include/blockcodec.h "${pkgdir}/usr/include/blockcodec.h"
    install -Dm644 share/doc/blockcodec/README.md "${pkgdir}/usr/share/doc/blockcodec/README.md"
    install -Dm644 share/doc/blockcodec/spec.md "${pkgdir}/usr/share/doc/blockcodec/spec.md"
    install -Dm644 share/doc/blockcodec/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 share/doc/blockcodec/LICENSING.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSING.md"
    cp -r share/doc/blockcodec/LICENSES "${pkgdir}/usr/share/licenses/${pkgname}/"
}
