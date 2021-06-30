# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=6.4.0
pkgrel=1
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h' 'armv6h')
url='https://sensu.io'
license=('MIT')
if [ "$CARCH" = "armv7h" ]; then
		source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
    sha256sums=('27ab948098bacdefac7191e78188ddd3d4f11c76a6f9fc95038769840cdd9087')
fi
if [ "$CARCH" = "armv6h" ]; then
		source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv6.tar.gz")
    sha256sums=('5831a828a77802e982ff9252621aa358fa8344e8c4e9c415def9f7e102ffd944')
fi
if [ "$CARCH" = "x86_64" ]; then
		source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
    sha256sums=('fa76ee4cae1770c09b45afa3847dcdbbf0e85d5e6424639869734df0346c1ea5')
fi

build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

# TODO: better build from source
# build() {}
package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}
