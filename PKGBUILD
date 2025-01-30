# Maintainer: tdiant <i@tdiant.net>
# Contributor: Azure Zeng <weedycn at outlook dot com>
# Contributor: Josh Cass <archlinux.okyuf@passmail.net>

pkgname=quarkuscli-bin
pkgver=3.18.1
checksum=1910e2f3efeda40dfdb68e9b529638af1ae661eb85dc9e0c98b02c0d633b396c
pkgrel=1
pkgdesc='Create projects, manage extensions and perform build and development tasks for Quarkus, the Kubernetes Native Java stack tailored for OpenJDK HotSpot and GraalVM.'
url='https://github.com/quarkusio/quarkus'
source_x86_64=("https://github.com/quarkusio/quarkus/releases/download/$pkgver/quarkus-cli-$pkgver.tar.gz")
arch=('x86_64')
license=('Apache')
depends=('java-runtime')
optdepends=()
conflicts=()
provides=('quarkus')
options=(!strip)
sha256sums_x86_64=("$checksum")

package() {
  install -Dm0755 "${srcdir}/quarkus-cli-$pkgver/bin/quarkus" "${pkgdir}/usr/bin/quarkus"
  #install -Dm0644 "${srcdir}/quarkus-cli-$pkgver/bin/quarkus.bat" "${pkgdir}/usr/bin/quarkus.bat"
  install -Dm0644 "${srcdir}/quarkus-cli-$pkgver/lib/quarkus-cli-$pkgver-runner.jar" "${pkgdir}/usr/lib/quarkus-cli-$pkgver-runner.jar"
  install -Dm0644 "${srcdir}/quarkus-cli-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
