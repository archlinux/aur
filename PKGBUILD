# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=rabbitmq-web-stomp
pkgver=2.8.2preview
pkgrel=1
pkgdesc="A bridge between RabbitMQ-STOMP plugin and a Websockets server (SockJS)"
arch=(i686 x86_64)
url=http://www.rabbitmq.com/blog/2012/05/14/introducing-rabbitmq-web-stomp/
license=('MPL')
install=rabbitmq-web-stomp.install
depends=('rabbitmq>=2.8.2')
source=('http://www.rabbitmq.com/releases/plugins/v2.8.2-web-stomp-preview/cowboy-0.5.0-rmq2.8.2-git4b93c2d.ez'
'http://www.rabbitmq.com/releases/plugins/v2.8.2-web-stomp-preview/sockjs-0.2.1-rmq2.8.2-gitfa1db96.ez'
'http://www.rabbitmq.com/releases/plugins/v2.8.2-web-stomp-preview/rabbitmq_web_stomp-2.8.2.ez'
'http://www.rabbitmq.com/releases/plugins/v2.8.2-web-stomp-preview/rabbitmq_web_stomp_examples-2.8.2.ez'
)
md5sums=('fe9612dc8a15f4475868478336e4225d'
         'e3123e7e8e52be724328c8f5c444e7b5'
         '7910e6cb8345414b958813b681544aad'
         '035f9b9e5ffdaa52524054636821752d')

package() {
  cd "$srcdir"
  _plugindir=$pkgdir/usr/lib/rabbitmq/plugins
  install -d  $_plugindir
  install -m644 *.ez $_plugindir
}

# vim:set ts=2 sw=2 et:
