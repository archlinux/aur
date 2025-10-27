# Maintainer: Stezko <stezko@gmail.com>

_pkgname=yandex-browser
pkgname=yandex-browser-corporate
pkgver=25.8.4.866
_pkgver=25.8.4.866-1
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
"vulkan-icd-loader")
optdepends=("speech-dispatcher" "gstreamer-meta" "cryptopro-csp-k1")

source=("${pkgname}-${_pkgver}.deb::https://repo.yandex.ru/${_pkgname}/deb/pool/main/y/${pkgname}/${pkgname}_${_pkgver}_amd64.deb")
sha256sums=("61fdbd600feb5c8835f938975dc360463eaf69084fdb92645b5686a14435cfb6")
install=${pkgname}.install

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
    chmod 4755 "${pkgdir}"/opt/yandex/browser/yandex_browser-sandbox
}
