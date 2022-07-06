# Maintainer: Cassio Almeida <jcassiocosta@gmail.com>
# Maintainer: Claudio Netto <nettinhorama@gmail.com>

pkgname=tsuru
pkgver=1.10.4
pkgrel=1
arch=('armv6h' 'i686' 'x86_64')

pkgdesc='Command-line tool for application developers managing apps, services or workloads through Tsuru.'
url='https://github.com/tsuru/tsuru-client'
license=('BSD')

provides=("tsuru=${pkgver}")

source_armv6h=("tsuru-client.tar.gz::${url}/releases/download/${pkgver}/tsuru_${pkgver}_linux_arm64.tar.gz")
sha256sums_armv6h=('c85f4a3e8ea4b44ba2c084b1dbc7a4566feb5c18b3f9a2c7e0b62e05a2dfef8e')

source_i686=("tsuru-client.tar.gz::${url}/releases/download/${pkgver}/tsuru_${pkgver}_linux_386.tar.gz")
sha256sums_i686=('55164666eb08f39c939bfe854b0754c00d595ba45ff81685284c2149d463a135')

source_x86_64=("tsuru-client.tar.gz::${url}/releases/download/${pkgver}/tsuru_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('2b84500621ec583ef11f38b5b52a785db045791523bf21555b0c3083094b6238')

prepare() {
  tar xzf tsuru-client.tar.gz
}

package(){
  install -Dpm755 tsuru -t ${pkgdir}/usr/bin

  install -Dm644 ./misc/bash-completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 ./misc/zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
