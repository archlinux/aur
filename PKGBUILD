# Maintainer: foi <foi@live.ru>

pkgname=osquery-bin
pkgver=3.3.0
pkgrel=1
pkgdesc="osquery is an operating system instrumentation framework."
arch=('x86_64')
url="https://osquery.io/"
license=('Apache License 2.0')
depends=('glibc' 'bash' 'zlib')
conflicts=('osquery-git' 'kolide-git')
sha256sums=('147a716ebcc9a281728f95941b04d3c83063aa9d192a0173e12eb37a0f455491')
source=("https://osquery-packages.s3.amazonaws.com/linux/osquery-${pkgver}_${pkgrel}.linux_x86_64.tar.gz")

package() {
  cp -r etc "$pkgdir/"
  cp -r usr "$pkgdir/"
  cp -r var "$pkgdir/"
}

post_install() {
  systemctl daemon-reload
}
