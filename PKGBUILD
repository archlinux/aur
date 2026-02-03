# Maintainer: Stezko <stezko@gmail.com>

_pkgname=yandex-browser
pkgname=yandex-browser-corporate
pkgver=25.12.1.1303
_pkgver=25.12.1.1303-1
pkgrel=2

pkgdesc="The web browser from Yandex.
 Yandex Browser is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=("x86_64")
url='https://browser.yandex.com/'
license=("custom:yandex-browser")
categories=("network")
provides=(yandex-browser-corporate)
conflicts=('yandex-browser' 'yandex-browser-beta')

depends=("binutils" "ttf-liberation" "jq" "alsa-lib" "at-spi2-atk" "curl" "dbus" "expat" "libcups" "mesa" "gtk4" "nss" "squashfs-tools" "wget" "xdg-utils"
"vulkan-icd-loader" "libxcomposite")
optdepends=("speech-dispatcher" "gstreamer-meta" "cryptopro-csp-k1")

source=("${pkgname}-${_pkgver}.deb::https://repo.yandex.ru/${_pkgname}/deb/pool/main/y/${pkgname}/${pkgname}_${_pkgver}_amd64.deb")
sha256sums=("97cb8dc07d072bb544ad6e386924a0618d7507d1ca2352f9dc77326124ff66c9")
install=${pkgname}.install

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
    chmod 4755 "${pkgdir}"/opt/yandex/browser/yandex_browser-sandbox
}
