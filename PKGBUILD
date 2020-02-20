# Maintainer: Michał Lisowski <lisu@riseup.net>

pkgname=kaf
pkgver=0.1.28
pkgrel=2
pkgdesc="Kafka CLI inspired by kubectl & docker"
arch=('x86_64')
license=('Apache')
url="https://github.com/birdayz/kaf"
source=("$pkgname"::"https://github.com/birdayz/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('4249e08a02a710f604cb9304aa1251a3')

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

