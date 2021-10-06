# Maintainer: Cassio Almeida <jcassiocosta@gmail.com>
# Maintainer: Claudio Netto <nettinhorama@gmail.com>

pkgname=tsuru
pkgver=1.10.0
pkgrel=1
arch=('armv6h' 'i686' 'x86_64')

pkgdesc='Command-line tool for application developers managing apps, services or workloads through Tsuru.'
url='https://github.com/tsuru/tsuru-client'
license=('BSD')

provides=("tsuru=${pkgver}")

source_armv6h=("tsuru-client.tar.gz::${url}/releases/download/${pkgver}/tsuru_${pkgver}_linux_arm64.tar.gz")
sha256sums_armv6h=('cb915eb60aef91a1e3cab8f2c27054181e98ba8068ff06a7a0482a4b774de27c')

source_i686=("tsuru-client.tar.gz::${url}/releases/download/${pkgver}/tsuru_${pkgver}_linux_386.tar.gz")
sha256sums_i686=('f5882c20472cdeae0de14b4f381b7ed06dd23eb650e762aa68feb1f860c6fcb6')

source_x86_64=("tsuru-client.tar.gz::${url}/releases/download/${pkgver}/tsuru_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('9740bac3fb56179dbc8f750f4a35e2782492f36f2cc5e70c118f1ebbfc841f3c')

prepare() {
  tar xzf tsuru-client.tar.gz
}

package(){
  install -Dpm755 tsuru -t ${pkgdir}/usr/bin

  install -Dm644 ./misc/bash-completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 ./misc/zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
