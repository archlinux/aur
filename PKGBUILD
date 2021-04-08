# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=6.2.7
pkgrel=1
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h' 'armv6h')
url='https://sensu.io'
license=('MIT')
if [ "$CARCH" = "armv7h" ]; then
		source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
    sha256sums=('346c6db3cc2f8186ac34083cb5635d98226f72dcfaedb658af317f7d5d0aa662')
fi
if [ "$CARCH" = "armv6h" ]; then
		source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv6.tar.gz")
    sha256sums=('a73f124cc79c4d9abf439066787cb72e2078ab3c91e63b7bb5ad9bb605cbdffd')
fi
if [ "$CARCH" = "x86_64" ]; then
		source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
    sha256sums=('a3975544da13720908f43f48cce0a8c2ebf2f7d9491955376242e5cd171f3e38')
fi

build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

# TODO: better build from source
# build() {}
package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}
