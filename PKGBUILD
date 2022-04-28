# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=kafka-gitops
pkgver=0.2.15
pkgrel=3
pkgdesc="Manage Apache Kafka topics and generate ACLs through a desired state file."
arch=('x86_64')
url="https://github.com/devshawn/kafka-gitops"
depends=('java-runtime')
license=('Apache-2')
source=(
  "https://github.com/devshawn/${pkgname}/releases/download/${pkgver}/${pkgname}.zip"
  "https://raw.githubusercontent.com/devshawn/kafka-gitops/${pkgver}/LICENSE")
sha256sums=('182e35a3693a6864e58d47ef419141486adb19acb9385120257a03088789abe8'
            '43ad86bd3bd2db3b6b240fa83987ff785e05b775c0a5309dee80aa6f1a72031f')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
