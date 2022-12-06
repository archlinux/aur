# Maintainer: thorko contact@thorko.de
pkgname=sensu-agent
pkgver=6.9.1
pkgrel=0
pkgdesc="Sensu Go Agent"
arch=('x86_64' 'armv7h' 'aarch64')
url='https://sensu.io'
license=('MIT')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=('8ba6d396296e2254cc1e91b83b05f34b484f43d49a8bbfe895ee1dfa8f1e3871')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('d632dc3ad61720cdf1e7081b9943b727efe891bf1d0c6c725f09899e74819403')
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('0abbec61bc6485b3519363bc9cf4a589bbd2087e8a25df474372fd79f2be7f3c')

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
