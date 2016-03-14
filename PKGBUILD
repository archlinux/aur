# Maintainer : HipsterWhale < jeremy AT seban DOT eu >

pkgname=dockerbeat
pkgver=1.0.0_beta2
pkgrel=1
pkgdesc="A tool to push container metrics to elastic"
arch=('x86_64')
license=('Apache')
depends=('docker')
makedepends=('docker')
provides=('dockerbeat')
source=('https://github.com/Ingensi/dockerbeat/archive/v1.0.0-beta2.tar.gz')
sha256sums=('1792f3a519c37ff5b21f10ea6a149fa8b9abbafc20027d4a927285c2396e106f')

build() {
  cd dockerbeat-1.0.0-beta2
  make dockermake
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  cp "${srcdir}/dockerbeat-1.0.0-beta2/dockerbeat" "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/etc/dockerbeat/"
  cp "${srcdir}/dockerbeat-1.0.0-beta2/etc/dockerbeat.yml" "${pkgdir}/etc/dockerbeat/dockerbeat.yml"
}
