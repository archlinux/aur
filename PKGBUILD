# Maintainer: Kshamendra Kumar Mishra <kshamendrakumarmishra@gmail.com>

pkgname=netmuxd-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="A replacement/addition to usbmuxd, enabling iOS wireless device syncing on Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/jkcoxson/netmuxd"
license=('LGPL2.1')
depends=('glibc')
provides=('netmuxd')
conflicts=('netmuxd')

source_x86_64=("netmuxd-v$pkgver-x86_64.tar.gz::https://github.com/jkcoxson/netmuxd/releases/download/v$pkgver/netmuxd-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("netmuxd-v$pkgver-aarch64.tar.gz::https://github.com/jkcoxson/netmuxd/releases/download/v$pkgver/netmuxd-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/jkcoxson/netmuxd/v$pkgver/LICENSE")
sha256sums=('596c3c0e8bea14135aa214d23b81d39d0417ec435cf76f3d8f6849dda50db307')
sha256sums_x86_64=('1a85e69a258349d2e130aa8475f9d18f212331db3ab46843c0b8b05020f556bb')
sha256sums_aarch64=('3431e8c2a393a64e49a465c5887125eba293b7b143328ce8ec099b504e242ca4')

prepare() {
  tar -xf netmuxd-v"$pkgver"-*.tar.gz
}

package() {
  install -Dm755 "${srcdir}/netmuxd" "$pkgdir/usr/bin/netmuxd"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
