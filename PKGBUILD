# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=rabbitmqadmin
pkgver=3.6.2
pkgrel=1
pkgdesc='A command-line tool for managing RabbitMQ server (requires "management" plugin)'
arch=('any')
url="http://www.rabbitmq.com/management-cli.html"
license=('MPL')
depends=('python')
source=(
    https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/rabbitmq_v${pkgver//./_}/bin/rabbitmqadmin
    https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/master/LICENSE-MPL-RabbitMQ
)
sha256sums=(
    'SKIP'
    'SKIP'
)

prepare() {
    sed -e "s_%%VSN%%_${pkgver}_" -i rabbitmqadmin
}

package() {
    install -Dm755 rabbitmqadmin "${pkgdir}/usr/bin/rabbitmqadmin"
    install -Dm644 LICENSE-MPL-RabbitMQ "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
