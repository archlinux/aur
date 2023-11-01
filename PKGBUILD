# Maintainer: Gabriel Sakash gabrielsakash@gmail.com

_pkgname=port-checker
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Application to check if a TCP port works with a Golang HTTP server. Pre-compiled'
url='https://github.com/qdm12/port-checker/'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
license=('MIT')
source=("https://raw.githubusercontent.com/qdm12/port-checker/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/qdm12/port-checker/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64")
source_aarch64=("https://github.com/qdm12/port-checker/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
source_armv6h=("https://github.com/qdm12/port-checker/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6")
source_armv7h=("https://github.com/qdm12/port-checker/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
source_i686=("https://github.com/qdm12/port-checker/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386")
noextract=("${source[@]##*/}")
sha256sums=('0ae758cc523d6b771cd9034bc9d1b1e150c3d2855a6a3be6bd8a9f48c67adb5d')
sha256sums_x86_64=('3e7e17d772d99d545e7f63a8d03a470171516bf0cfb4ce7af7629f2458fc0c64')
sha256sums_aarch64=('2bca10a1a10d61968c7ac53a854989e65039869cba827da27c5a0ed9f34750ab')
sha256sums_armv6h=('603f363b66674422fda18b2999e64b84d0ff1dc0cf0350e9a1fcde1c33e1180c')
sha256sums_armv7h=('2f6ae99ed050d8764b613280b5295a1b312a12422c06777b99d15470f759da00')
sha256sums_i686=('43aefe52c4589185ff0b4bb2a1000b8f0b0d5edbc80a0face6c3d102f8f0eb2e')

case "$CARCH" in
    armv6h) _pkgarch='armv6'
           ;;
    armv7h) _pkgarch='armv7'
           ;;
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

