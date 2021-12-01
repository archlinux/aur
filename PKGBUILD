# Maintainer: thorko contact@thorko.de
pkgname=sensu-cli
pkgver=6.6.1
pkgrel=0
pkgdesc="Sensu Go cli"
arch=('x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://sensu.io'
license=('MIT')
if [ "$CARCH" = "armv7h" ]; then
		source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv7.tar.gz")
    sha256sums=('3963ae0b3d6f00ca62ba6e33e97a654297915297272823385e62fe9732b498b9')
fi
if [ "$CARCH" = "armv6h" ]; then
		source=("${pkgname}-${pkgver}_armv7h.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_armv6.tar.gz")
    sha256sums=('bcad4990c31779f39e01808009c06235ca96bd3d6ac0b6a4cdd6fbfd523684dd')
fi
if [ "$CARCH" = "x86_64" ]; then
		source=("${pkgname}-${pkgver}_x86_64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_amd64.tar.gz")
    sha256sums=('c5ec12bdacbf7de805c00ab94a9d521705f77fe039ce003a9306b50783184c4f')
fi
if [ "$CARCH" = "aarch64" ]; then
  source=("${pkgname}-${pkgver}_aarch64.tar.gz::https://s3-us-west-2.amazonaws.com/sensu.io/sensu-go/${pkgver}/sensu-go_${pkgver}_linux_arm64.tar.gz")
  sha256sums=('2fbc59d2ffe0b351f80de12f6f224b4628782e9d7cb0ef811efe0eb8a933ce90')
fi


build() {
        tar xzvf ${pkgname}-${pkgver}_$CARCH.tar.gz
}

# TODO: better build from source
# build() {}
package() {
    install -Dm755 "${srcdir}/sensuctl" "${pkgdir}/usr/bin/sensuctl"
}
