# Maintainer: Guru <anjanaya@gmail.com>
# Contributor: Piotr Sarna <piotr@sarna.dev>

pkgname=redpanda-bin
pkgver=26.2.2
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
sha256sums_x86_64=('e4d5fa4b4a3ce8f773226ab8e87de1f71394a702aa955e2b2093012fe13f761e')
sha256sums_aarch64=('111be6e5005d106cb760615d0fa8df0d5963303ac13195daca52cce7c711fcf1')
noextract=(${pkgname}-${pkgver}-x86_64.zip ${pkgname}-${pkgver}-aarch64.zip)

prepare() {
    mkdir -p redpanda-bin
    bsdtar -xf "${pkgname}-${pkgver}-$CARCH.zip" -C redpanda-bin
    chmod +x redpanda-bin/rpk
}

package() {
    install -Dm0755 "$pkgname/rpk" "$pkgdir/usr/bin/rpk"
}
