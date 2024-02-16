# Maintainer: thorko contact@thorko.de
pkgname=sensu-agent
pkgver=6.10.0
pkgrel=0
pkgdesc="Sensu Go Agent"
arch=('x86_64' 'armv7h' 'aarch64')
url='https://sensu.io'
license=('MIT')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=('a7be4ecbfd8c9c9dafc2f8a7f9840fde12362ea83cc02ca4556e99498a04b45c')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('bdf866b3558b77ed6b764f6b52148fba89290cc0393f451ade03d255ff0dc429')
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('21e5d3283c8b30eaa9e86e0d43f52a663644c115526585d0050a2f2c0d30e30b')

install=sensu-agent.install

source=(
        "sensu-agent.service"
        "agent.yml.example"
        )
sha256sums=(
            '7d8ca2731fe4a07beab0566d11ed47f0c069774752a96781ac7797697b3f7cc5'
            'c9997fa4be0879bb73b7250863ce9737b422515cf9131626075ff313b4575eed'
          )

package() {
    install -Dm755 "${srcdir}/sensu-agent" "${pkgdir}/usr/bin/sensu-agent"
    install -Dm0644 "sensu-agent.service" "${pkgdir}/usr/lib/systemd/system/sensu-agent.service"
    install -Dm0644 "agent.yml.example" "${pkgdir}/etc/sensu/agent.yml.example"
}
