# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=hostsctl
pkgver=0.1.2
pkgrel=1
pkgdesc="block advertisements, trackers, and other malicious activity by manipulating /etc/hosts"
arch=("any")
url="https://github.com/pigmonkey/hostsctl"
license=("GPLv3")
conflicts=("hostsctl-git")
source=(${pkgname}-v${pkgver}.tar.gz::https://github.com/pigmonkey/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=("3a7ac6ae71f38fc5675ceeafd0b788a3")
install=hostsctl.install

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/hostsctl.sh "${pkgdir}/usr/bin/hostsctl"
  install -Dm644 etc/hostsctl.conf "${pkgdir}/usr/share/doc/${pkgname}/hostsctl.conf"
  install -Dm644 hostsctl.bash-completion "${pkgdir}/usr/share/bash-completion/completions/hostsctl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
