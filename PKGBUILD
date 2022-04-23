# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=zenith-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Terminal system monitor with histograms, written in Rust"
arch=('x86_64')
url="https://github.com/bvaisvil/zenith"
license=('MIT')
provides=('zenith')
conflicts=('zenith')
optdepends=('nvidia-utils')
source=("${url}/releases/download/${pkgver}/zenith_0.13.0-1_amd64.deb")
sha256sums=('0aaec2dd711f5904dc80a12a31be1867e11a8c204cc3feeecbf6fe5cef98a5db')

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
