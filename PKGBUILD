# Maintainer: foi <foi@live.ru>

pkgname=osquery-bin
pkgver=2.11.2
pkgrel=1
pkgdesc="osquery is an operating system instrumentation framework."
arch=('x86_64')
url="https://osquery.io/"
license=('Apache License 2.0')
depends=('glibc' 'bash' 'zlib')
conflicts=('osquery-git' 'kolide-git')
sha256sums=('6b9f032bf04a0a938c4cd2a7f24f0f4fef1aca8593661f3801822760b178fdbd')
source=("https://osquery-packages.s3.amazonaws.com/linux/osquery-${pkgver}_${pkgrel}.linux_x86_64.tar.gz")

package() {
  cp -r etc "$pkgdir/"
  cp -r usr "$pkgdir/"
  cp -r var "$pkgdir/"
}

post_install() {
  systemctl daemon-reload
}
