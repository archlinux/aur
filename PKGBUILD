# Maintainer: tdiant <i@tdiant.net>
# Contributor: Azure Zeng <weedycn at outlook dot com>
# Contributor: Josh Cass <archlinux.okyuf@passmail.net>

pkgname=quarkuscli-bin
pkgver=3.26.3
checksum=885249d65d449683f70a10da545d62a49039e226bf4c7625fb490cbdf267e5ae
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
