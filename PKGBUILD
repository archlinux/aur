# Maintainer LA-MJ [ 4mr.minj at google-mail , com ]
pkgname=fcast-receiver-bin
epoch=1
pkgver=2.2.4
pkgrel=1
pkgdesc="Binary releases of Fcast"
arch=('x86_64')
conflicts=("fcast-receiver-bin" "fcast-receiver-git" "fcast-receiver")
provides=("fcast-receiver")
url="https://gitlab.futo.org/videostreaming/fcast"
license=('MIT')
depends=(
'alsa-lib'
'at-spi2-core'
'cairo'
'dbus'
'expat'
'gcc-libs'
'glib2'
'glibc'
'gtk3'
'libcups'
'libdrm'
'libudev.so=1'
'libx11'
'libxcb'
'libxcomposite'
'libxdamage'
'libxext'
'libxfixes'
'libxkbcommon'
'libxrandr'
'mesa'
'nspr'
'nss'
'pango'
)
source=("${pkgname}.deb::https://dl.fcast.org/electron/${pkgver}/deb/x64/fcast-receiver-${pkgver}-linux-x64.deb")
sha256sums=('f89953b60eda63aaf73d64c70ea7d55205a9a22a0b2da80ff829eaa73f64a4dd')

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"
    install -Dm644 "${pkgdir}/usr/share/doc/fcast-receiver/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -r "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/lintian"
}
