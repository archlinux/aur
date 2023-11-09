# Maintainer: pandada8 <pandada8@gmail.com>
pkgname=jaeger-all-in-one-bin
pkgver=1.51.0
pkgrel=1
pkgdesc='open source, distributed tracing platform'
arch=('x86_64')
url='https://github.com/jaegertracing/jaeger'
license=('APACHE')
provides=('jaeger-all-in-one')

source=(
  "jaeger-${pkgver}.tar.gz::https://github.com/jaegertracing/jaeger/releases/download/v${pkgver}/jaeger-${pkgver}-linux-amd64.tar.gz"
)
sha512sums=('9a44d6e3273073588f6f70d2f0d448e9681af9c9995801ff8304a5ac78f160e772559b2c1559ff39a852a7e94dad3922cb1ff6bebf1dfa640dddbfc3f94abd2a')

package() {
  for i in all-in-one agent collector ingester query; do
    install -D "${srcdir}/jaeger-${pkgver}-linux-amd64/jaeger-${i}" "${pkgdir}/usr/bin/jaeger-${i}"
  done
}
