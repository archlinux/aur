# Maintainer: thorko contact@thorko.de
pkgname=sensu-backend
pkgver=6.8.0
pkgrel=0
pkgdesc="Sensu Go Backend"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('MIT')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=('0c069005e7d95ac08976e78e3025df95b829d7a5f613b78de7acf7a645b8a6c3')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('0fe5b814db96ce6bf8c3f4608f3e9adad38f0f6826475d6e568aa15ab2052447')
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('98cb29cb5dac1229c381ad55c1fc5c7e4a29da399ac15c7f7a680fb6daf1f146')

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
