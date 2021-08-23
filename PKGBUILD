# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=tracer-bin
_pkgname=Tracer
pkgver=1.7.1
pkgrel=1
pkgdesc="Posterior summarisation in Bayesian phylogenetics"
arch=('x86_64')
url="https://github.com/beast-dev/tracer"
license=('unknown')
source=("https://github.com/beast-dev/tracer/releases/download/v${pkgver}/Tracer_v${pkgver}.tgz" "tracer.desktop")
sha256sums=('200d7ffa1e48994b71245994e299847ac2be72d3d5c37d9048418557e1d8c12e'
            '07c099a1d34b4718d46e083b98cf9352e50d81ee6cb7346544cd9d1248f02ea8')
depends=(
	'java-runtime'
)
package() {
    install -dm755 "$pkgdir"/usr/{bin,share/{${_pkgname},applications}}
    mv ${srcdir}/Tracer_v${pkgver}/* ${pkgdir}/usr/share/${_pkgname}
    ln -s /usr/share/Tracer/bin/tracer ${pkgdir}/usr/bin/tracer
    
    install -m 755 ${srcdir}/tracer.desktop ${pkgdir}/usr/share/applications/tracer.desktop
}
