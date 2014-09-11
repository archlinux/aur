# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=docker-enter-git
_pkgname=docker-enter
pkgver=r35.76a789a
pkgrel=1
pkgdesc="nsenter for Docker"
arch=('any')
url="https://github.com/jpetazzo/nsenter"
license=('(unknown)')
depends=('docker' 'sh' 'util-linux>=2.25')
provides=('docker-enter')
conflicts=('docker-enter')
source=('nsenter::git+https://github.com/jpetazzo/nsenter')
md5sums=('SKIP')

pkgver() {
  cd nsenter
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd nsenter

  install -Dm755 docker-enter "$pkgdir/usr/bin/docker-enter"
}

# vim:set ts=2 sw=2 et:
