# Maintainer: Goldbro233 bowensun_06@outlook.com
_pkgname=aio-coding-hub
pkgname=${_pkgname}-bin
pkgver=0.32.1
pkgrel=1
pkgdesc="一个All In One的本地AI工具, 支持Win/Mac/Linux"
arch=('x86_64')
url="https://github.com/dyndynjyxa/aio-coding-hub"
options=('!strip' '!debug')
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=(
    'glibc'
    'libgcc'
    'glib2'
    'libsoup3'
    'cairo'
    'webkit2gtk-4.1'
    'gtk3'
    'gdk-pixbuf2'
    'hicolor-icon-theme'
)

source=(
    "${url}/releases/download/${_pkgname}-v${pkgver}/${_pkgname}-linux-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/dyndynjyxa/aio-coding-hub/main/LICENSE"
)


sha256sums=('f50bc7135b01a7863de41c3bb7222e9e00bb99a8ca4f9ff573ce36378ca274ad'
            '90da602b3e6d5f01c42a2bf635376f3d874abc524d10651f27cb278d9a04aa73')

package() {
    tar xf data.tar.* -C "${pkgdir}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/DEBIAN"
    rm -rf "${pkgdir}/usr/share/doc/${_pkgname}"
}
