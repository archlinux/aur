# Maintainer: asm0dey <me@asm0dey.site>
pkgname=unregistry
pkgver=0.4.2
pkgrel=1
pkgdesc="Push docker images directly to remote servers without an external registry"
arch=(any)
url="https://github.com/psviderski/unregistry/"
license=('Apache-2.0')
source=("docker-pussh-$pkgver::https://raw.githubusercontent.com/psviderski/unregistry/refs/tags/v$pkgver/docker-pussh")
sha256sums=('6d50532246619cb13d3e56af61bbc715227f91e19ae07a9c1a8ed77a5f7849f9')
depends=(docker bash)

package() {
    install -dm 755 $pkgdir/usr/lib/docker/cli-plugins
    install -m 755 "$srcdir/docker-pussh-$pkgver" $pkgdir/usr/lib/docker/cli-plugins/docker-pussh
}
