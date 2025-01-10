# Maintainer: xihale <xihale.top@qq.com>

pkgname="v2rayn-bin"
pkgver=7.5.6
pkgrel=2
pkgdesc="A GUI client for Windows and Linux, support Xray core and others"
arch=("x86_64" "arm64")
license=('GPL3')
url="https://github.com/2dust/v2rayN"
options=('!strip') # TODO: after striping, it cannot run

source_x86_64=("https://github.com/2dust/v2rayN/releases/download/${pkgver}/v2rayN-linux-64.zip")
sha256sums_x86_64=(0939b0b4ae951bb6c8c9eb0c9d07549851ade1f89e5086eac1e9067ad4026391)
source_arm64=("https://github.com/2dust/v2rayN/releases/download/${pkgver}/v2rayN-linux-arm64.zip")
sha256sums_arm64=(37540cfb3e055e8a5a4fa52706cbd413c34becc51a73297fc233cf803134800e)

source+=("v2rayN.png" "v2rayN-bin.desktop")
sha256sums+=('f762fd95d93c2287f55ebb742716a54aa6b507ff8c8d75aec7256fabc93192ee'
            'c3193fc83a87c6a0c7bd10fbfc2cbbd568d33bc33be0b8e6b3773e6207a8b07d')

package() {

    _app_name=$pkgname

    install -Dm644 "${srcdir}/v2rayN.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/v2rayN-bin.desktop" -t "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/opt/$_app_name"
    mv "${srcdir}/v2rayN-linux-64"/* "${pkgdir}/opt/$_app_name/"
    chmod -R 0777 ${pkgdir}/opt/$_app_name

}

