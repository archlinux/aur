# Maintainer: aic0d3r <funforfreeapps@gmail.com>
pkgname=z13ctl-plus-bin
pkgver=2.5.0
pkgrel=1
pkgdesc='z13ctl fork (co-installable with upstream): CLI and daemon for RGB, fan curves, TDP, battery and tablet control on the 2025 ASUS ROG Flow Z13'
arch=('x86_64')
url='https://github.com/aic0d3r/z13ctl-plus'
license=('Apache-2.0')
depends=('glibc')
provides=('z13ctl-plus')
conflicts=('z13ctl-plus')
optdepends=('ryzen_smu-dkms-git: SMU access for CPU undervolting (Strix Halo Curve Optimizer requires the amkillam fork of ryzen_smu)')
install=z13ctl-plus-bin.install
source=("https://github.com/aic0d3r/z13ctl-plus/releases/download/v${pkgver}/z13ctl-plus_${pkgver}_linux_amd64.tar.gz")
sha256sums=('26884c108edf617b2b0e9871a324caadce0c2138abaa01425de677cddcbce786')

package() {
    install -Dm755 "z13ctl-plus"                                    "${pkgdir}/usr/bin/z13ctl-plus"
    install -Dm644 "LICENSE"                                        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "contrib/systemd/user/z13ctl-plus.socket"       "${pkgdir}/usr/lib/systemd/user/z13ctl-plus.socket"
    install -Dm644 "contrib/systemd/user/z13ctl-plus.service"      "${pkgdir}/usr/lib/systemd/user/z13ctl-plus.service"
    install -Dm644 "contrib/systemd/system/z13ctl-plus-perms.service" "${pkgdir}/usr/lib/systemd/system/z13ctl-plus-perms.service"
}
