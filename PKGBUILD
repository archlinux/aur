# Maintainer: Sander Boom <sanderboom@gmail.com>

pkgname=whatsapp-desktop
pkgver=1.1.0
pkgrel=1
pkgdesc="Unofficial WhatsApp for Desktop"
arch=('i686' 'x86_64')
url="http://whatsapp-desktop.com/"
license=('MIT')
depends=('libsystemd' 'desktop-file-utils')
makedepends=('tar')
source_x86_64=("https://github.com/Aluxian/WhatsApp-Desktop/releases/download/v${pkgver}/UnofficialWhatsApp_linux64.deb")
source_i686=("https://github.com/Aluxian/WhatsApp-Desktop/releases/download/v${pkgver}/UnofficialWhatsApp_linux32.deb")
noextract_x86_64=("UnofficialWhatsApp_linux64.deb")
noextract_i686=("UnofficialWhatsApp_linux32.deb")
install='whatsapp-desktop.install'
md5sums_i686=('6df0d7f8cf1ecae103c8f8651677f6af')
md5sums_x86_64=('5649ce38080ae50d7710bf433cb12a53')

options=(!strip)

prepare() {
    cd "${srcdir}"
    ar x "UnofficialWhatsApp_linux64.deb"
}

package() {
    cd "${srcdir}"
    tar -C "${pkgdir}" -xf data.tar.gz
}
