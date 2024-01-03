# Maintainer: Fang Erjing <szdytom@qq.com>
pkgname=kd-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="A crystal clean command-line dictionary."
arch=('x86_64' 'aarch64')
url="https://github.com/Karmenzind/kd"
license=('MIT')
depends=()
provides=('kd')
conflicts=('kd')
source=('LICENSE' 'kd-server.service')
sha256sums=('01fc1f8f20ef852628985a6fdb862fadd1c2f3b438cd3104c6a8e724bc16986a'
'98c414c016faefb96f0f5e998328d60a5a248c71eb17b89b0d52784779f95940')
source_x86_64=("kd::https://github.com/Karmenzind/kd/releases/download/v${pkgver}/kd_linux_amd64")
sha256sums_x86_64=('e615a1b76f885d0f065384656346b25990ece57f2450971be5ed8c402c7442d3')
source_aarch64=("kd::https://github.com/Karmenzind/kd/releases/download/v${pkgver}/kd_linux_arm64")
sha256sums_aarch64=('e615a1b76f885d0f065384656346b25990ece57f2450971be5ed8c402c7442d3')

package() {
	cd "$srcdir/"
	install -Dm755 kd $pkgdir/usr/bin/kd
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/kd/LICENSE
	install -Dm644 kd-server.service $pkgdir/usr/lib/systemd/user/kd-server.service
}

