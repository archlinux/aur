# Maintainer: Lloyd Henning <lloyd.w.henning@gmail.com>
pkgname=ob-xd
pkgver=2.8
_vershort=28
pkgrel=1
pkgdesc="Virtual Analog Synthesizer VST based on the Oberheim OB-X"
arch=(x86_64)
url="https://github.com/reales/OB-Xd"
license=('GPL3')
depends=('alsa-lib' 'freetype2' 'libcurl-gnutls')
provides=('OB-Xd')
source=("https://github.com/reales/OB-Xd/releases/download/v${pkgver}/Obxd${_vershort}Linux.zip")
noextract=("Obxd${_vershort}Linux.zip")
md5sums=("2ebbcf4115691900f1b8ad7ee2937560")

prepare() {
install -d "${srcdir}/Obxd${_vershort}Linux"
bsdtar -xvf "Obxd${_vershort}Linux.zip" -C "Obxd${_vershort}Linux"
}

package() {
cd "${srcdir}/Obxd${_vershort}Linux"

install -Dm755 "OB-Xd" "${pkgdir}/usr/bin/OB-Xd"
install -D "OB-Xd.so" "${pkgdir}/usr/bin/OB-Xd.so"

install -d "${pkgdir}/usr/lib/vst3/"
install -d "${pkgdir}/opt/"

cp -r "OB-Xd.vst3" "${pkgdir}/usr/lib/vst3/"
cp -r "discoDSP" "${pkgdir}/opt/discoDSP"
}
