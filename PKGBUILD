# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname=xmm7360-usb-modeswitch
pkgname=xmm7360-usb-modeswitch-git
pkgver=r22.224e60c
pkgrel=1
pkgdesc='Tools for the Fibocom L850-GL / Intel XMM7360 LTE modem'
arch=('x86_64')
url="https://github.com/xmm7360/xmm7360-usb-modeswitch"
license=('none')
depends=('acpi_call')
makedepends=('git')
provides=('xmm7360-usb-modeswitch')
conflicts=('xmm7360-usb-modeswitch')
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd $_pkgname
  install -Dm755 xmm2usb "$pkgdir"/usr/bin/$_pkgname
}

# vim:set ts=2 sw=2 et:
