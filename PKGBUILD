# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=zenith-bin
pkgver=0.13.0
pkgrel=2
pkgdesc="Terminal system monitor with histograms, written in Rust"
arch=('x86_64')
url="https://github.com/bvaisvil/zenith"
license=('MIT')
provides=('zenith')
conflicts=('zenith')
optdepends=('nvidia-utils')
source=("${url}/releases/download/${pkgver}/zenith_${pkgver}-1_amd64.deb")
sha256sums=('6efffe6c819bd7a5e6aeff90b8692a39855f7128c0fb78d8c83e2b278326d928')

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
