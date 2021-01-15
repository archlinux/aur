# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=zenith-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Terminal system monitor with histograms, written in Rust"
arch=('x86_64')
url="https://github.com/bvaisvil/zenith"
license=('MIT')
provides=('zenith')
conflicts=('zenith')
optdepends=('nvidia-utils')
source=('https://dl.bintray.com/bvaisvil/debian/pool/z/zenith/zenith_0.12.0-1_amd64.deb')
sha256sums=('515969f924f862da9d7cd7713e31d87670d744c924257a7d6032fd4440fee2e7')

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
