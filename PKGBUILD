# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=zenith-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Terminal system monitor with histograms, written in Rust"
arch=('x86_64')
url="https://github.com/bvaisvil/zenith"
license=('MIT')
provides=('zenith')
conflicts=('zenith')
optdepends=('nvidia-utils')
source=("${url}/releases/download/${pkgver}/zenith_${pkgver}-1_amd64.deb")
sha256sums=('04f7adb77eb9545f63e09e940b7b2d9232f7d8926fec7d4e5c4409d2f7c10b4f')

package() {
    # extract package data
    tar xf "data.tar.xz"

    # binary
    install -D -m755 {,"$pkgdir"/}usr/bin/zenith

    # license
    install -D -m644 'usr/share/doc/zenith/copyright' "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    # desktop icon and entry
    install -D -m644 {,"$pkgdir"/}usr/share/pixmaps/zenith.png
    install -D -m644 {,"$pkgdir"/}usr/share/applications/zenith.desktop
}
