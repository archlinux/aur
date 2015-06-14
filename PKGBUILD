# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>
 
pkgname=rabbitmqadmin
pkgver=3.5.3
pkgrel=1
pkgdesc='A command-line tool for managing RabbitMQ server (requires "management" plugin)'
arch=('any')
url="http://www.rabbitmq.com/management-cli.html"
license=('MPL')
depends=('python')
source=(https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/rabbitmq_v${pkgver//./_}/bin/rabbitmqadmin)
sha256sums=('SKIP')

prepare() {
    sed -e "s_%%VSN%%_${pkgver}_" -i rabbitmqadmin
}
		  
package() {
    install -Dm755 rabbitmqadmin "${pkgdir}/usr/bin/rabbitmqadmin"
}
