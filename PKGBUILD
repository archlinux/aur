# Maintainer: Stezko <stezko@gmail.com>

_pkgname=browser-corporate
pkgname=yandex-browser-corporate
pkgver=25.2.4.1036
_pkgver=25.2.4.1036-1
pkgrel=1

pkgdesc="The web browser from Yandex.
 Yandex Browser is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=("x86_64")
url='https://browser.yandex.com/'
license=("custom:yandex-browser")
categories=("network")
provides=(yandex-browser-corporate)
conflicts=('yandex-browser' 'yandex-browser-beta')

depends=( "binutils" "ttf-liberation" "jq" "alsa-lib" "at-spi2-atk" "libcups" "curl" "dbus" "mesa" "gdbm" "gtk4" "nspr" "nss" "pango"
"wayland" "libxcomposite" "libxdamage" "libxkbcommon" "libxkbfile" "libxrandr" "squashfs-tools" "wget" "xdg-utils" "harfbuzz-icu"
"vulkan-driver" "vulkan-icd-loader" "ffmpeg")
optdepends=("speech-dispatcher" "gstreamer-meta" "cryptopro-csp-k1")

source=("${pkgname}-${_pkgver}.deb::https://repo.yandex.ru/yandex-browser/deb/pool/main/y/${pkgname}/${pkgname}_${_pkgver}_amd64.deb")
sha256sums=("ef9a3b79acdc61c30ca256d30cbd5c5c1c234ae573062d7bc6d650a66f047001")
install=${pkgname}.install

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
    chmod 4755 "${pkgdir}"/opt/yandex/browser/yandex_browser-sandbox
}
