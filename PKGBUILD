# Maintainer: Michał Lisowski <lisu@riseup.net>

pkgname=kaf
pkgver=0.1.29
pkgrel=1
pkgdesc="Kafka CLI inspired by kubectl & docker"
arch=('x86_64')
license=('Apache')
url="https://github.com/birdayz/kaf"
source=("$pkgname"::"https://github.com/birdayz/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('2662936f07f7b6654978db4c24d5183a')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 kaf "${pkgdir}/usr/bin/${pkgname}"

  # Generate bash completion script
  mkdir -p "${pkgdir}/etc/bash_completion.d"
  ./kaf completion bash > "${pkgdir}/etc/bash_completion.d/kaf"
}

