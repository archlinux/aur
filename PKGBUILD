# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=6.2.4
pkgrel=1
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h' 'armv6h')
url='https://sensu.io'
license=('MIT')
if [ "$CARCH" = "armv7h" ]; then
		source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
    sha256sums=('cea796d5a0db18f624a4a587d03bdb67f39067ad3ae531e9e342b1d3fe8b8d05')
fi
if [ "$CARCH" = "armv6h" ]; then
		source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv6.tar.gz")
    sha256sums=('8cf2b89578ccc75b395b5ba4109f9d19a6503415ba83701d2d2eefa331e37749')
fi
if [ "$CARCH" = "x86_64" ]; then
		source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
    sha256sums=('717ff4054ac77e13d05d7d8ebac57a89c49a4c3521e96c9ec90bd60916ceb7cf')
fi

build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

# TODO: better build from source
# build() {}
package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}
