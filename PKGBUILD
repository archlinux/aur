# Maintainer: foi <foi@live.ru>

pkgname=osquery-bin
pkgver=4.0.2
pkgrel=1
pkgdesc="osquery is an operating system instrumentation framework."
arch=('x86_64')
url="https://osquery.io/"
license=('Apache License 2.0')
depends=('glibc' 'bash' 'zlib')
conflicts=('osquery-git' 'kolide-git')
sha256sums=('b32f052250908eefabdd582e07aa5e206ab1899762d728bc1a17dae5151070b4')
source=("https://osquery-packages.s3.amazonaws.com/linux/osquery-${pkgver}_${pkgrel}.linux_x86_64.tar.gz")

package() {
  cp -r etc "$pkgdir/"
  cp -r usr "$pkgdir/"
  cp -r var "$pkgdir/"
}

post_install() {
  systemctl daemon-reload
}
