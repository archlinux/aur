# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=zenith-bin
pkgver=0.12.0
pkgrel=2
pkgdesc="Terminal system monitor with histograms, written in Rust"
arch=('x86_64')
url="https://github.com/bvaisvil/zenith"
license=('MIT')
provides=('zenith')
conflicts=('zenith')
optdepends=('nvidia-utils')
source=("${url}/releases/download/${pkgver}/zenith_${pkgver}-1_amd64.deb")
sha256sums=('51d6b6c1785ba59a08ea57171ba55be9f8267f6ac3ef319e8e4cbe919676204b')

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
