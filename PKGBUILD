# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: SteveXMH <stevexmh@qq.com>

pkgname=sharpcraftlauncher
pkgver=1.2.0
pkgrel=2.0
_build_date=20240216
pkgdesc="A very light, fast, simple, rust-made Minecraft launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/Steve-xmh/scl"
license=('LGPL3')
options=('!strip')
conflicts=('scl-bin')
depends=('openssl-1.1')
optdepends=('jre-openjdk: for Minecraft launch')
source_x86_64=("logo.png" "sharpcraftlauncher.desktop" "${pkgname}-${arch}.tar.gz::${url}/releases/download/v${pkgver}/SharpCraftLauncher-${_build_ver}-${pkgver}-linux-${arch}.tar.gz")
source_aarch64=("logo.png" "sharpcraftlauncher.desktop" "${pkgname}-${arch}.tar.gz::${url}/releases/download/v${pkgver}/SharpCraftLauncher-${_build_ver}-${pkgver}-linux-${arch}.tar.gz")
sha256sums_x86_64=('df9946a3ba6720aad1fac168e02b4222de560f85e4e24027d9283cc1c97b29be'
                   '26f14e0a128bdd32b3e5800007c314b4350a06e4f51467b7e15a92d83dc7b51d'
                   'c779cc16d6cf89c70602fdea4b7d7f9985f34827e91ceaeb927dfd243dd556ae')
sha256sums_aarch64=('df9946a3ba6720aad1fac168e02b4222de560f85e4e24027d9283cc1c97b29be'
                    '26f14e0a128bdd32b3e5800007c314b4350a06e4f51467b7e15a92d83dc7b51d'
                    'c779cc16d6cf89c70602fdea4b7d7f9985f34827e91ceaeb927dfd243dd556ae')

prepare() {
    tar -xf ${pkgname}-${arch}.tar.gz
}

package() {
    install -Dm 755 "SharpCraftLauncher-${_build_date}-${pkgver}-${arch}" ${pkgdir}/usr/bin/sharpcraftlauncher
    install -Dm 644 logo.png ${pkgdir}/usr/share/icons/hicolor/512x512/app/sharpcraftlauncher.png
    install -Dm 644 sharpcraftlauncher.desktop ${pkgdir}/usr/share/applications/sharpcraftlauncher.desktop
}
