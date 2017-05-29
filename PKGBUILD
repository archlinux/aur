# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=hostsctl
pkgver=0.1.0
pkgrel=1
pkgdesc="block advertisements, trackers, and other malicious activity by manipulating /etc/hosts"
arch=("any")
url="https://github.com/pigmonkey/hostsctl"
license=("GPLv3")
conflicts=("hostsctl-git")
source=(${pkgname}-v${pkgver}.tar.gz::https://github.com/pigmonkey/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=("bd8498bf40f8a9e4d873ae61181ea26c")
install=hostsctl.install

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/hostsctl.sh "${pkgdir}/usr/bin/hostsctl"
  install -Dm644 etc/hostsctl.conf "${pkgdir}/usr/share/doc/${pkgname}/hostsctl.conf"
  install -Dm644 hostsctl.bash-completion "${pkgdir}/usr/share/bash-completion/completions/hostsctl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
