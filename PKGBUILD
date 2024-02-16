# Maintainer: thorko contact@thorko.de
pkgname=sensu-backend
pkgver=6.10.0
pkgrel=0
pkgdesc="Sensu Go Backend"
arch=('x86_64' 'armv7h' 'aarch64')
url='https://sensu.io'
license=('MIT')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=('a7be4ecbfd8c9c9dafc2f8a7f9840fde12362ea83cc02ca4556e99498a04b45c')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('bdf866b3558b77ed6b764f6b52148fba89290cc0393f451ade03d255ff0dc429')
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('21e5d3283c8b30eaa9e86e0d43f52a663644c115526585d0050a2f2c0d30e30b')

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
