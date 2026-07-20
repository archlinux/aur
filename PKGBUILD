# Maintainer: Kaley Burdow <kaleidox@comroid.org>

pkgname=rabbitmq-client-git
pkgver=0.1
pkgrel=1
pkgdesc="CLI RabbitMQ client"
arch=('any')
url="https://git.comroid.org/comroid/rabbitmq-client"
license=('GPL-3.0')
depends=('dotnet-runtime-10.0')
makedepends=('dotnet-sdk-10.0')
source=("git+https://git.comroid.org/comroid/rabbitmq-client.git")
md5sums=('SKIP')
options+=("!strip")

build() {
    cd rabbitmq-client
    dotnet publish -c Release --use-current-runtime
}

package() {
    install -Dm755 "rabbitmq-client/rabbitmq-client/bin/Release/net10.0/linux-x64/publish/rabbitmq-client" "$pkgdir/usr/bin/rabbitmq-client"
}
