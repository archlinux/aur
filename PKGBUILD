# Maintainer: thorko contact@thorko.de
pkgname=sensu-backend
pkgver=6.8.2
pkgrel=0
pkgdesc="Sensu Go Backend"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('MIT')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=('7b66ee962983e947c7e64262e908cecfce9df71d7294489c6b5e53e82cf0bb6a')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('9bee5669ac0721c4e6cc597173e8c157289740ae88a3113d01c8851dc39b8163')
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('60f409057685eb80d3d015d3e0435d267ba837c05c50df43d554889e88e86177')

source=(
        "sensu-backend.service"
        "backend.yml.example"
      )
sha256sums=(
            '57c4e7835da2d58186e8e36518dc9e0b7cee93bd018619ec2a7210bf212d0d27'
            '29cf533a6b324ede8f2d774954bdbf879d0bf4470244cba5e7fbe1b935c1c4e9'
          )

install=sensu-backend.install

package() {
    install -Dm755 "${srcdir}/sensu-backend" "${pkgdir}/usr/bin/sensu-backend"
    install -Dm0644 "sensu-backend.service" "${pkgdir}/usr/lib/systemd/system/sensu-backend.service"
    install -Dm0644 "backend.yml.example" "${pkgdir}/etc/sensu/backend.yml.example"
}
