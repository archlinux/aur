# Maintainers: kmz <valesail7@gmail.com>; Fang Erjing <szdytom@qq.com>
pkgname=kd-bin
pkgver=0.0.14
pkgrel=1
pkgdesc="A crystal clean command-line dictionary."
arch=('x86_64' 'aarch64')
url="https://github.com/Karmenzind/kd"
license=('MIT')
# options=('!debug')
depends=()
provides=('kd')
conflicts=('kd')

source=('LICENSE' 'kd-server.service')
sha256sums=('01fc1f8f20ef852628985a6fdb862fadd1c2f3b438cd3104c6a8e724bc16986a'
'89eb98a14555b6a6fe1209ce428b39abe348ca36affea432572dc3ac81a75517')

source_x86_64=("kd-${pkgver}::https://github.com/Karmenzind/kd/releases/download/v${pkgver}/kd_linux_amd64")
source_aarch64=("kd-${pkgver}::https://github.com/Karmenzind/kd/releases/download/v${pkgver}/kd_linux_arm64")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir/"
    install -Dm755 kd-${pkgver} $pkgdir/usr/bin/kd
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/kd/LICENSE
    install -Dm644 kd-server.service $pkgdir/usr/lib/systemd/user/kd-server.service
}

