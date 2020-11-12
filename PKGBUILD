# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=zenith-bin
pkgver=0.11.0
pkgrel=2
pkgdesc="Terminal system monitor with histograms, written in Rust"
arch=('x86_64')
url="https://github.com/bvaisvil/zenith"
license=('MIT')
provides=('zenith')
conflicts=('zenith')
optdepends=('nvidia-utils')
source=('https://dl.bintray.com/bvaisvil/debian/pool/z/zenith/zenith_0.11.0-1_amd64.deb')
sha256sums=('6966a0673ea7de1fd1f113a86ee7e79e3083220c9153ebf8d212b5ae0e1ad8cd')

package() {
    # extract package data
    tar xf "data.tar.xz"

    # launch script
    install -D -m755 {,"$pkgdir"/}usr/bin/zenith

    # binaries
    install -d "$pkgdir"/usr/lib/zenith
    cp -a usr/lib/zenith "$pkgdir"/usr/lib

    # license
    install -D -m644 'usr/share/doc/zenith/copyright' "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    # desktop icon and entry
    install -D -m644 {,"$pkgdir"/}usr/share/pixmaps/zenith.png
    install -D -m644 {,"$pkgdir"/}usr/share/applications/zenith.desktop
}
