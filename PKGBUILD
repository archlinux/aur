# Maintainer: necklace <ns@nsz.no>

pkgname=jperf
pkgver=2.0.2
pkgrel=1
pkgdesc="Java Perf - GUI for iPerf"
arch=('any')
url="https://shadow.github.io/"
license=('custom')
depends=('jre8-openjdk' 'iperf')
source=(
    "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/xjperf/jperf-2.0.2.zip"
    "jperf.sh"
)
sha256sums=(
    "b7cf9d675c2f2945312f1b7783c6c4cad3cbe4df70b787d0188dca46190ada82"
    "da44da5ca1eb4a539860ea58176ec9c8a350a7c5be8b4acb14ab36ed261672db"
)

package() {

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/jperf.jar" ${pkgdir}/usr/share/java/${pkgname}/jperf.jar

    install -d ${srcdir}/${pkgname}-${pkgver}/lib ${pkgdir}/usr/share/java/${pkgname}/lib

    for f in "${srcdir}/${pkgname}-${pkgver}/lib/*.jar"; do
        echo $f
        install -Dm644 $f ${pkgdir}/usr/share/java/${pkgname}/lib/;
    done

    install -Dm755 "${srcdir}/${pkgname}.sh" ${pkgdir}/usr/bin/${pkgname}

}
