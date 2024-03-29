# Maintainer: Twor <i@twor.me>
# Contributor: SteveXMH <stevexmh@qq.com>

pkgname=scl-bin
pkgver=1.2.0
pkgrel=1.0
pkgdesc="A very light, fast, simple, rust-made Minecraft launcher"
appname="SharpCraftLauncher"
version="20240216"
arch=('x86_64' 'aarch64')
url="https://github.com/Steve-xmh/scl"
license=('LGPL3.0')
options=('!strip')
conflicts=('scl-bin')
depends=('openssl-1.1')
optdepends=('jre-openjdk: for Minecraft needed')
source_x86_64=("logo.png" "${pkgname}.desktop" "${url}/releases/download/v${pkgver}/${appname}-${version}-${pkgver}-linux-${arch}.tar.gz")
source_aarch64=("logo.png" "${pkgname}.desktop" "${url}/releases/download/v${pkgver}/${appname}-${version}-${pkgver}-linux-${arch}.tar.gz")
sha256sums_x86_64=('SKIP' 'SKIP' 'SKIP')
sha256sums_aarch=('SKIP' 'SKIP' 'SKIP')

prepare() {
    tar -zxvf ${appname}-${version}-${pkgver}-linux-${arch}.tar.gz
}

package() {
    install -Dm 755 "${appname}-${version}-${pkgver}-${arch}" ${pkgdir}/usr/bin/${pkgname}
    install -Dm 644 logo.png ${pkgdir}/usr/share/icons/hicolor/512x512/app/${pkgname}.png
    install -Dm 644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
