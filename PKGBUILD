# Maintainer: aic0d3r <funforfreeapps@gmail.com>
pkgname=z13ctl-plus-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='z13ctl-plus CLI and daemon for ASUS ROG Flow Z13 hardware control'
arch=('x86_64')
url='https://github.com/aic0d3r/z13ctl-plus'
license=('Apache-2.0')
provides=('z13ctl')
conflicts=('z13ctl')
depends=('glibc')
optdepends=('ryzen_smu-dkms-git: CPU undervolting via Curve Optimizer')
install=z13ctl-plus-bin.install
source=("https://github.com/aic0d3r/z13ctl-plus/releases/download/v${pkgver}/z13ctl-plus_${pkgver}_linux_amd64.tar.gz")
sha256sums=('22cd7fcedeb9740387f1e2ccae1ef7ef96b478b3c8dd9769e46f88786e50facb')

package() {
    install -Dm755 "z13ctl"                                         "${pkgdir}/usr/bin/z13ctl"
    install -Dm644 "LICENSE"                                        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "contrib/systemd/user/z13ctl.socket"            "${pkgdir}/usr/lib/systemd/user/z13ctl.socket"
    install -Dm644 "contrib/systemd/user/z13ctl.service"           "${pkgdir}/usr/lib/systemd/user/z13ctl.service"
    install -Dm644 "contrib/systemd/system/z13ctl-perms.service"   "${pkgdir}/usr/lib/systemd/system/z13ctl-perms.service"
}
