# Maintainer: tarball <bootctl@gmail.com>

pkgname=ethr-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Comprehensive Network Measurement Tool for TCP, UDP & ICMP'
url='https://github.com/microsoft/ethr'
arch=(x86_64)
license=(MIT)
provides=(ethr)
conflicts=(ethr)
depends=(glibc)

source=("https://github.com/microsoft/ethr/releases/download/v$pkgver/ethr_linux.zip")
sha256sums=('781f48294b6623ef22fd95b432e1c9c113acc4c45cd223d538da2e6976783721')

package() {
  install -Dm755 ethr "$pkgdir"/usr/bin/ethr

  # ICMP tests without requiring root
  setcap cap_net_raw+ep "$pkgdir"/usr/bin/ethr
}
