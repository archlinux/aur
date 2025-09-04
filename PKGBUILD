# Maintainer:  Rubin Simons <me@rubin55.org>

# Note: You need to buy and download RCU yourselves at
# the RCU website and place the archlinux variant next
# to the PKGBUILD file.
pkgname=rcu-bin
pkgver=4.0.28
pkgrel=1
pkgdesc="reMarkable Connection Utility (RCU)"
arch=('x86_64')
url="http://www.davisr.me/projects/rcu/"
license=('AGPL3')
source=(
    "local://rcu-${pkgver}-archlinux.tar.gz"
    "rcu.desktop"

)
sha256sums=('e1769bc70eba19f0d81c51dcc401840a3c90065ac267559894261f0f18979b54'
            'b2c876686d260b2b55553e00d0870e55d1f4fd23b60ba88e6767770e4aae1c5c')
options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/rcu" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
    install -o root -g root -m 755 "${srcdir}/rcu-${pkgver}-archlinux/rcu" "${pkgdir}/usr/bin/rcu"
    install -o root -g root -m 644 "${srcdir}/rcu-${pkgver}-archlinux/User Manual.pdf" "${pkgdir}/usr/share/rcu/manual.pdf"
    install -o root -g root -m 644 "${srcdir}/rcu-${pkgver}-archlinux/davisr-rcu.png" "${pkgdir}/usr/share/pixmaps/rcu.png"
    install -o root -g root -m 644 "${srcdir}/rcu.desktop" "${pkgdir}/usr/share/applications/rcu.desktop"
}
