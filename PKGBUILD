# Maintainer: Noah Schlenker noschl@proton.me
_tag=0324c0c9bcc43758d65e6ca18ed5ccaf9555e32b
_sourceName="yap"

pkgname="youtube-audio-puller-git"
pkgver=1.0.1
pkgrel=1
pkgdesc="YAP: Download Audio from Invidious by link or automatic search, from Apple music by playlist link"
arch=("any")
url="https://github.com/noahpy/yap"
license=("GPL-3.0-only")
depends=('curl' 'ffmpeg' 'tageditor-cli' 'sh' 'wget')
makedepends=(git)
optdepends=()
source=("git+${url}.git#tag=${_tag}?signed")
md5sums=("SKIP")
validpgpkeys=(BCC20DB39D0DB4ADDAC8AA910C02F52CBFEC0FCD)

pkgver() {
  cd "${_sourceName}"
  git describe --tags | sed 's/^v//'
}


package() {
    cd "${_sourceName}"
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    install -Dm 755 yap.sh "${pkgdir}"/usr/bin/yap
}
