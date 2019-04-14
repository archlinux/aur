# Maintainer: foi <foi@live.ru>

pkgname=osquery-bin
pkgver=3.3.2
pkgrel=1
pkgdesc="osquery is an operating system instrumentation framework."
arch=('x86_64')
url="https://osquery.io/"
license=('Apache License 2.0')
depends=('glibc' 'bash' 'zlib')
conflicts=('osquery-git' 'kolide-git')
sha256sums=('05b0b15bd44e6a85813dd92a567c371031938aedbcd2e64d32229a3ca0c2d509')
source=("https://osquery-packages.s3.amazonaws.com/linux/osquery-${pkgver}_${pkgrel}.linux_x86_64.tar.gz")

package() {
  cp -r etc "$pkgdir/"
  cp -r usr "$pkgdir/"
  cp -r var "$pkgdir/"
}

post_install() {
  systemctl daemon-reload
}
