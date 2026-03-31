# Maintainer: Stezko <stezko@gmail.com>

_pkgname=yandex-browser
pkgname=yandex-browser-corporate
pkgver=26.3.1.1020
_pkgver=26.3.1.1020-1
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
sha256sums=("a180dfb5cd0f2e38f5ce8fabcda0a5f71997c9bdbef878f6ec4821493eced3d3")
install=${pkgname}.install

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
    chmod 4755 "${pkgdir}"/opt/yandex/browser/yandex_browser-sandbox
}
