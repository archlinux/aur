# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: SteveXMH <stevexmh@qq.com>

pkgname=sharpcraftlauncher
pkgver=1.1.3
pkgrel=1.0
pkgdesc="A very light, fast, simple, rust-made Minecraft launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/Steve-xmh/scl"
license=('LGPL3')
options=('!strip')
optdepends=('jre-openjdk: for Minecraft needed')
source_x86_64=("logo.png" "sharpcraftlauncher.desktop" "${pkgname}-${arch}.tar.gz::${url}/releases/download/v${pkgver}/SharpCraftLauncher-20231107-${pkgver}-linux-${arch}.tar.gz")
source_aarch64=("logo.png" "sharpcraftlauncher.desktop" "${pkgname}-${arch}.tar.gz::${url}/releases/download/v${pkgver}/SharpCraftLauncher-20231107-${pkgver}-linux-${arch}.tar.gz")
sha256sums_x86_64=('SKIP' 'SKIP' 'SKIP')
sha256sums_aarch=('SKIP' 'SKIP' 'SKIP')

prepare() {
    tar -xf ${pkgname}-${arch}.tar.gz
    mv SharpCraftLauncher-20231107-${pkgver}-linux-${arch} ${pkgname}-${arch}
}

package() {
    install -Dm 755 "${pkgname}-${arch}" ${pkgdir}/usr/bin/sharpcraftlauncher
    install -Dm 644 logo.png ${pkgdir}/usr/share/icons/hicolor/512x512/app/sharpcraftlauncher.png
    install -Dm 644 sharpcraftlauncher.desktop ${pkgdir}/usr/share/applications/sharpcraftlauncher.desktop
}
