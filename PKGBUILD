# Maintainer: thorko contact@thorko.de
pkgname=sensu-agent
pkgver=6.8.0
pkgrel=0
pkgdesc="Sensu Go Agent"
arch=('x86_64' 'armv7h' 'aarch64')
url='https://sensu.io'
license=('MIT')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=('0c069005e7d95ac08976e78e3025df95b829d7a5f613b78de7acf7a645b8a6c3')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('0fe5b814db96ce6bf8c3f4608f3e9adad38f0f6826475d6e568aa15ab2052447')
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('98cb29cb5dac1229c381ad55c1fc5c7e4a29da399ac15c7f7a680fb6daf1f146')

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
