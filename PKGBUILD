# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=tracer-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Posterior summarisation in Bayesian phylogenetics"
arch=('x86_64')
url="https://github.com/beast-dev/tracer"
license=('unknown')
source=("https://github.com/beast-dev/tracer/releases/download/v1.7.1/Tracer_v1.7.1.tgz")
sha256sums=('bc62c6ae0ac0e9ea24e670b4b60445xa53ck3134c1ab80b654e618eb2be6224c')
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
package() {
    mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/bin"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/applications"
    mkdir "${pkgdir}/usr/share/Tracer"
    mkdir "${pkgdir}/usr/share/Tracer/bin"
    mkdir "${pkgdir}/usr/share/Tracer/images"
    mkdir "${pkgdir}/usr/share/Tracer/lib"
    install -m 755 ${srcdir}/Tracer_v${pkgver}/bin/tracer ${pkgdir}/usr/share/Tracer/bin/tracer
    install -m 755 ${srcdir}/Tracer_v${pkgver}/images/Tracer.png ${pkgdir}/usr/share/Tracer/images/Tracer.png
    install -m 755 ${srcdir}/Tracer_v${pkgver}/lib/tracer.jar ${pkgdir}/usr/share/Tracer/lib/tracer.jar
    install -m 755 ${srcdir}/Tracer_v${pkgver}/lib/quaqua-filechooser-only.jar ${pkgdir}/usr/share/Tracer/lib/quaqua-filechooser-only.jar
    install -m 755 ${srcdir}/Tracer_v${pkgver}/README.txt ${pkgdir}/usr/share/Tracer/README.txt
    ln -s ${pkgdir}/usr/share/Tracer/bin/tracer ${pkgdir}/usr/bin/tracer
    cd "${srcdir}"
    cp ~/.cache/yay/tracer-bin/tracer.desktop ${pkgdir}/usr/share/applications
}
