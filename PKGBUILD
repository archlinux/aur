# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=talosctl
pkgver=0.4.0
pkgrel=2
pkgdesc='CLI for Talos - A modern OS for Kubernetes'
arch=('any')
url='https://github.com/talos-systems/talos'
license=('MPL2')
makedepends=('go')
source=("https://github.com/talos-systems/talos/archive/v${pkgver}.tar.gz")
b2sums=('2802a96148c1bb87f05ff662e48adfb9bf238afe1e4260b0858b7e48dc10c58f30fd675236072c193c119307a479f7c6a3335884d0bb92976102a8566c9d8b9e')

build() {
  cd ${pkgname%ctl}-${pkgver}/cmd/talosctl
  go build -trimpath -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd ${pkgname%ctl}-${pkgver}/cmd/talosctl
  install -Dm755 talosctl "${pkgdir}"/usr/bin/talosctl
}
