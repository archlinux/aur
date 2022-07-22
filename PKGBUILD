# Maintainer: thorko contact@thorko.de
pkgname=sensu-backend
pkgver=6.7.4
pkgrel=3
pkgdesc="Sensu Go Backend"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('MIT')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
sha256sums_armv7h=('81ba39335b95eaca0ca019b33b6f2c03e1d74d75eeffa7bb59779dfcb6635e76')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('15adc6a7fcb1b4b7bb9150974eef715433475f575af5b726c0f4e4128acfd102')
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('2c63ea234facc1be601c4d1a6c00fe4a5f6faff1f429527ee8e4caaac7385f75')

source=(
        "sensu-backend.service"
        "backend.yml.example"
        "users.conf"
      )
sha256sums=(
            '57c4e7835da2d58186e8e36518dc9e0b7cee93bd018619ec2a7210bf212d0d27'
            '29cf533a6b324ede8f2d774954bdbf879d0bf4470244cba5e7fbe1b935c1c4e9'
            '5059739620935fb98fa3d3eab83d8633c8c407688c92d7374f833ea92b934360'
          )

install=sensu-backend.install

package() {
    install -Dm755 "${srcdir}/sensu-backend" "${pkgdir}/usr/bin/sensu-backend"
    install -Dm0644 "sensu-backend.service" "${pkgdir}/usr/lib/systemd/system/sensu-backend.service"
    install -Dm0644 "backend.yml.example" "${pkgdir}/etc/sensu/backend.yml.example"
    install -Dm0644 "users.conf" "${pkgdir}/usr/lib/sysusers.d/sensu.conf"
}
