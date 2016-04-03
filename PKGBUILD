pkgname=flume-ng-rabbitmq
pkgver=1.0
pkgrel=4
pkgdesc='Flume-NG RabbitMQ'
arch=('any')
url='https://github.com/jcustenborder/flume-ng-rabbitmq'
license=('Apache License')
depends=('apache-flume-ng')
makedepends=('java-environment>=6')
install=flume-ng-rabbitmq.install
source=('git+https://github.com/jcustenborder/flume-ng-rabbitmq.git')

md5sums=('SKIP')

build() {
  cd $pkgname
  mvn package
}

package() {
  mkdir -p $pkgdir/usr/share/java
  install -Dm644 $srcdir/flume-ng-rabbitmq/target/flume-rabbitmq-channel-1.0-SNAPSHOT.jar $pkgdir/usr/share/java/$pkgname.jar
}
