# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
_pkgname=interspec
pkgname="${_pkgname}-bin"
pkgver=1.0.9
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
    '7c3edcf85579796b9fa560224370379066c67687456995978fcc5efdd248e6a1'
    '3730c7e0599c7866e1eafb09efcc1b7e52ac8e85384836c80939da9fea3cd9b4')

package() {
    mkdir -p "${pkgdir}/opt/InterSpec"
    cp -R "${srcdir}/InterSpec-linux-x64/" -T "${pkgdir}/opt/InterSpec/"
	install -Dm644 "${srcdir}/InterSpec.desktop" "${pkgdir}/usr/share/applications/InterSpec.desktop"
    install -Dm644 "${srcdir}/InterSpec-linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    chmod +x "${pkgdir}/opt/InterSpec/InterSpec"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/InterSpec/InterSpec" "${pkgdir}/usr/bin/InterSpec"
}
