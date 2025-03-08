# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
_pkgname=interspec
pkgname="${_pkgname}-bin"
pkgver=1.0.13
pkgrel=1
pkgdesc="spectral radiation analysis software"
arch=('x86_64')
url="https://sandialabs.github.io/InterSpec/"
license=('LGPL')
options=(!emptydirs)
source=(
    "https://github.com/sandialabs/InterSpec/releases/download/v${pkgver}/InterSpec-linux-x64_v${pkgver}.zip"
    "InterSpec.desktop")
sha256sums=(
    'db4f1281c8d41caad11374474211c89d60143cf2fd4d3cb0971079fc1208d199'
    'e74585565970d08fdd6945c3289e0cc27bf1ad73ee003146b4db7398fbd33eb7')

package() {
    mkdir -p "${pkgdir}/opt/InterSpec"
    cp -R "${srcdir}/InterSpec-linux-x64/" -T "${pkgdir}/opt/InterSpec/"
    install -Dm644 "${srcdir}/InterSpec.desktop" "${pkgdir}/usr/share/applications/InterSpec.desktop"
    install -Dm644 "${srcdir}/InterSpec-linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    chmod +x "${pkgdir}/opt/InterSpec/InterSpec"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/InterSpec/InterSpec" "${pkgdir}/usr/bin/InterSpec"
}
