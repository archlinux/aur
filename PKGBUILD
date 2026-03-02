# Maintainer: Stezko <stezko@gmail.com>

_pkgname=yandex-browser
pkgname=yandex-browser-corporate
pkgver=25.12.4.1244
_pkgver=25.12.4.1244-1
pkgrel=1

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
sha256sums=("d983f89dc518748d71f39d48c9f6691c73091c06a979ebc6bb944729a79e3043")
install=${pkgname}.install

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
    chmod 4755 "${pkgdir}"/opt/yandex/browser/yandex_browser-sandbox
}
