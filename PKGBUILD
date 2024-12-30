# Maintainer: Zorbatron

_pkgname=port-checker
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Application to check if a TCP port works with a Golang HTTP server. Pre-compiled'
url='https://github.com/qdm12/port-checker/'
arch=('x86_64' 'aarch64' 'i686')
license=('MIT')
source=("https://raw.githubusercontent.com/qdm12/port-checker/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/qdm12/port-checker/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64")
source_aarch64=("https://github.com/qdm12/port-checker/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
source_i686=("https://github.com/qdm12/port-checker/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386")
noextract=("${source[@]##*/}")
sha256sums=('0ae758cc523d6b771cd9034bc9d1b1e150c3d2855a6a3be6bd8a9f48c67adb5d')
sha256sums_x86_64=('ce6cecb1ef7c2322d3efec42f507b0b359d4b83efa55365faa588e05ec8ef7fe')
sha256sums_aarch64=('ebed0f770861391282bba6e1be058bf6883346bc1ecce5ccad36b7da80d81f4d')
sha256sums_i686=('8a8678d2b64a5b02ef288d7c36bebdedee071e869048254c66dc4f41d61f0254')

case "$CARCH" in
    i686) _pkgarch='386'
           ;;
    x86_64) _pkgarch='amd64'
           ;;
    aarch64) _pkgarch='arm64'
esac


package() {
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 port-checker_${pkgver}_linux_${_pkgarch} "${pkgdir}/usr/bin/port-checker"
}

