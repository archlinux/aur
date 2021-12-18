# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=6.6.3
pkgrel=0
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://sensu.io'
license=('MIT')
if [ "$CARCH" = "armv7h" ]; then
		source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
    sha256sums=('85f98887b82553dc57a5fd5e04fed1f58007aa1443326ebe30cb8fed91d7e7fe')
fi
if [ "$CARCH" = "armv6h" ]; then
		source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv6.tar.gz")
    sha256sums=('cc1e43d1b5b1ad74774080d0d1a15c7dcddf36f002063bea903dd2247d223728')
fi
if [ "$CARCH" = "x86_64" ]; then
		source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
    sha256sums=('9160a18f005be88f0919503247b263784e8c4949978b296d1d24e79dd29fddcf')
fi
if [ "$CARCH" = "aarch64" ]; then
  source=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
  sha256sums=('416bc877af3b0aa3e7c2eb44247f6a2d4630b0e72e2c2058e306df28c4d86532')
fi


build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

# TODO: better build from source
# build() {}
package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}
