# Maintainer: Stezko <stezko@gmail.com>

_pkgname=browser-corporate
pkgname=yandex-browser-corporate
pkgver=24.6.1.858
_pkgver=24.6.1.858-1
pkgrel=1

pkgdesc="The web browser from Yandex.
 Yandex Browser is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
arch=("x86_64")
url='https://browser.yandex.com/'
license=("custom:yandex-browser")
categories=("network")
provides=(yandex-browser-corporate)
conflicts=('yandex-browser' 'yandex-browser-beta')

depends=( "binutils" "ttf-liberation" "jq" "alsa-lib" "at-spi2-atk" "libcups" "curl" "dbus" "libdrm" "gdbm" "gtk4" "nspr" "nss" "pango"
"wayland" "libxcomposite" "libxdamage" "libxkbcommon" "libxkbfile" "libxrandr" "squashfs-tools" "wget" "xdg-utils" "harfbuzz-icu" )
optdepends=(
    "speech-dispatcher"
    "vulkan-driver"
    "vulkan-icd-loader"
    "ttf-font"
    "gstreamer-meta"
    "cryptopro-csp-k1"
)

source=("${pkgname}-${_pkgver}.deb::https://repo.yandex.ru/yandex-browser/deb/pool/main/y/yandex-${_pkgname}/yandex-${_pkgname}_${_pkgver}_amd64.deb")
sha256sums=("982bcbf8538cbad16a3af30803f10d5b83ca33cbb96abe8d2beaedb44285014c")
install=yandex-browser-corporate.install

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
    chmod 4755 "${pkgdir}"/opt/yandex/browser/yandex_browser-sandbox
}
