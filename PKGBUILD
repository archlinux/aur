# Maintainer: foi <foi@live.ru>

pkgname=osquery-bin
pkgver=3.2.4
pkgrel=1
pkgdesc="osquery is an operating system instrumentation framework."
arch=('x86_64')
url="https://osquery.io/"
license=('Apache License 2.0')
depends=('glibc' 'bash' 'zlib')
conflicts=('osquery-git' 'kolide-git')
sha256sums=('9ae9c0b935288bb066571b1eebdf71095a1271e32871bb8eb71e4fda2183b8a7')
source=("https://osquery-packages.s3.amazonaws.com/linux/osquery-${pkgver}_${pkgrel}.linux_x86_64.tar.gz")

package() {
  cp -r etc "$pkgdir/"
  cp -r usr "$pkgdir/"
  cp -r var "$pkgdir/"
}

post_install() {
  systemctl daemon-reload
}
