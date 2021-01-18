# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=6.2.2
pkgrel=1
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h')
url='https://sensu.io'
license=('MIT')
if [ "$CARCH" = "armv7h" ]; then
		source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
		sha256sums=('c2f5601a254a569ff775976453e82c2f4fa23147c1b95f32286c53652aeaf038')
fi
if [ "$CARCH" = "x86_64" ]; then
		source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
		sha256sums=('2787738400a7bc7fd54a3f87aecd502520c3dc2146a7fe4c7b8d4a3ff9798a59')
fi

build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

# TODO: better build from source
# build() {}
package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}
