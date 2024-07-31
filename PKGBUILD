# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_pkgname="tpfanctl"
pkgname="${_pkgname}-bin"
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple ThinkPad fan control CLI for Linux, written in Rust (binary version)."
arch=("x86_64")
url="https://github.com/ezntek/tpfanspeed"
license=('MPL-2.0')
groups=()
provides=("tpfanctl" "setfan")
conflicts=("tpfanctl" "tpfanctl-bin" "tpfanctl-git")
depends=("lm_sensors")
makedepends=()
source=("${url}/releases/download/v${pkgver}/tpfanctl-linux-${arch}-v${pkgver}.tar.gz")
sha256sums=("c448049c1d61cbd07cbb6da177649d48eddac5e1474fb3e427a2dd4852828771")

package() {
    install -Dm755 "tpfanctl" "$pkgdir/usr/bin/tpfanctl"
    install -Dm755 "setfan" "$pkgdir/usr/bin/setfan"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
