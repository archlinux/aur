# Maintainer: Leon Mergen <leon@solatis.com>
pkgname=cloudflare-warp-bin
pkgver=2021.10.0
pkgrel=2
pkgdesc="Cloudflare Warp Client"

url="https://developers.cloudflare.com/warp-client/"
license=("unknown")

depends=("glibc" "dbus" "lz4" "zstd" "xz" "nftables" "libgpg-error")
arch=('x86_64')
provides=('warp-cli' 'warp-diag' 'warp-svc')
conflicts=('cloudflare-warp')

# in ubuntu: apt-get --print-uris install cloudflare-warp
source=("http://pkg.cloudflareclient.com/pool/dists/focal/main/cloudflare_warp_2021_10_0_1_amd64_916ef55734_amd64.deb")

sha256sums=('1e724fd480ed96b8a2bd9dcf65129ae4556097b98b96d062de3a5134d5f58270')
install=$pkgname.install

package() {
    mkdir ${pkgdir}/usr/
    tar -xzvf data.tar.gz  --exclude="usr" -C "${pkgdir}/usr/"
}
