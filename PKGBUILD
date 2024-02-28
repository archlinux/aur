# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mimic-bin"
pkgver=0.2.4
pkgrel=3
pkgdesc="A fast, local, neural text to speech system for Mycroft"
url="https://mycroft.ai/mimic-3/"
license=("AGPL3")
arch=("x86_64" "aarch64" "armv7h")
provides=("mimic")
conflicts=("mimic")
optdepends=("onnxruntime: use gpu")
source_x86_64=("https://github.com/MycroftAI/mimic3/releases/download/release%2Fv${pkgver}/mycroft-mimic3-tts_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/MycroftAI/mimic3/releases/download/release%2Fv${pkgver}/mycroft-mimic3-tts_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/MycroftAI/mimic3/releases/download/release%2Fv${pkgver}/mycroft-mimic3-tts_${pkgver}_armhf.deb")
sha256sums_x86_64=('a622280d00742c9bfc20b9c075c619c23b4184c757abecc3021397009c01e315')
sha256sums_aarch64=('57069d2e207c8d2e899b974d13e4985e4d5866a977ed9499bd2d229ddedddee8')
sha256sums_armv7h=('a0a32d9ad3e8b06e47cffc0d2fe88cd2acdb86dd33f1c5efd1fd03f5f5e8f22f')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "usr" "$pkgdir"
 ln -s "/usr/bin/mimic3" "$pkgdir/usr/bin/mimic"
 # partially working:
 ln -s "/usr/bin/mimic3-server" "$pkgdir/usr/bin/mimic-server"
 ln -s "/usr/bin/mimic3-download" "$pkgdir/usr/bin/mimic-download"
}
