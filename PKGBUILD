# Maintainer: robertfoster

pkgname=simonpi-git
pkgver=2.0.0.r0.g58a3c49
pkgrel=1
pkgdesc="A quick & dirty script to emulate Raspberry PI family devices on your laptop"
arch=(any)
url="https://github.com/M0Rf30/simonpi"
license=('GPL3')
depends=(
  'coreutils'
  'dnsmasq'
  'dosfstools'
  'e2fsprogs'
  'edk2-aarch64'
  'edk2-arm'
  'file'
  'grep'
  'iproute2'
  'iptables'
  'libarchive'
  'procps-ng'
  'qemu-system-aarch64'
  'qemu-system-arm'
  'sudo'
  'util-linux'
  'wget'
)
makedepends=('git')
install=simonpi-git.install
conflicts=("${pkgname%%-git}")
provides=("${pkgname%%-git}")
source=("${pkgname%%-git}::git+${url}")

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  install -Dm755 "${pkgname%%-git}" \
    "${pkgdir}/usr/bin/${pkgname%%-git}"
}

sha256sums=('SKIP')
