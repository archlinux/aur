# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: Piotr Sarna <piotr@sarna.dev>

pkgname=redpanda-bin
pkgver=26.1.5
pkgrel=1
pkgdesc='Redpanda is a streaming platform for mission critical workloads (binary package)'
arch=('x86_64' 'aarch64')
url='https://github.com/redpanda-data/redpanda'
license=('custom')
optdepends=()
conflicts=('redpanda-git' 'redpanda')
replaces=('redpanda-git' 'redpanda')
source_x86_64=(${pkgname}-${pkgver}-x86_64.zip::https://github.com/redpanda-data/redpanda/releases/download/v${pkgver}/rpk-linux-amd64.zip)
source_aarch64=(${pkgname}-${pkgver}-aarch64.zip::https://github.com/redpanda-data/redpanda/releases/download/v${pkgver}/rpk-linux-arm64.zip)
sha256sums_x86_64=('bcf8842c45fbd6a1b44c0af1db73236c70b50c9739710102fdd793e70ac0e242')
sha256sums_aarch64=('346603a256f0ef6b48cde292916feb8423219dafe0ee89908cef590c37030ed4')
noextract=(${pkgname}-${pkgver}-x86_64.zip ${pkgname}-${pkgver}-aarch64.zip)

prepare() {
    mkdir -p redpanda-bin
    bsdtar -xf "${pkgname}-${pkgver}-$CARCH.zip" -C redpanda-bin
    chmod +x redpanda-bin/rpk
}

package() {
    install -Dm0755 "$pkgname/rpk" "$pkgdir/usr/bin/rpk"
}
