# Maintainer LA-MJ [ 4mr.minj at google-mail , com ]
pkgname=fcast-receiver-bin
epoch=1
pkgver=2.2.2
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
sha256sums=('4afacb5861640fa9c9778e75d0d36cf3a3da3eab44c9dc85b60d6037e2650589')

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"
    install -Dm644 "${pkgdir}/usr/share/doc/fcast-receiver/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -r "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/lintian"
}
