# Maintainer:  Rubin Simons <me@rubin55.org>

# Note: You need to buy and download RCU yourselves at
# the RCU website and place the archlinux variant next
# to the PKGBUILD file.
pkgname=rcu-bin
pkgver=d2025.001r
pkgrel=1
pkgdesc="reMarkable Connection Utility (RCU)"
arch=('x86_64')
url="http://www.davisr.me/projects/rcu/"
license=('AGPL3')
source=(
    "local://rcu-${pkgver}-archlinux.tar.gz"
    "rcu.desktop"

)
sha256sums=('85ad62009b2902ef1d7aadc1987fb9a8848bcf9d088106995843bdcf25ce1db3'
            'b2c876686d260b2b55553e00d0870e55d1f4fd23b60ba88e6767770e4aae1c5c')
options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/rcu" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
    install -o root -g root -m 755 "${srcdir}/rcu-${pkgver}-archlinux/rcu" "${pkgdir}/usr/bin/rcu"
    install -o root -g root -m 644 "${srcdir}/rcu-${pkgver}-archlinux/User Manual.pdf" "${pkgdir}/usr/share/rcu/manual.pdf"
    install -o root -g root -m 644 "${srcdir}/rcu-${pkgver}-archlinux/davisr-rcu.png" "${pkgdir}/usr/share/pixmaps/rcu.png"
    install -o root -g root -m 644 "${srcdir}/rcu.desktop" "${pkgdir}/usr/share/applications/rcu.desktop"
}
