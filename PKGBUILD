# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=rootlesskit-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Linux-native 'fake root' for implementing rootless containers"
arch=('x86_64')
url="https://github.com/rootless-containers/rootlesskit"
license=('Apache')
optdepends=('containerd')
source=("rootlesskit-v${pkgver}-x86_64.tar.gz::https://github.com/rootless-containers/rootlesskit/releases/download/v${pkgver}/rootlesskit-x86_64.tar.gz")
sha256sums=('3c83affbb405cafe2d32e2e24462af9b4dcfa19e3809030012ad0d4e3fd49e8f')
provides=('rootlesskit')
conflicts=('rootlesskit')

package() {
  install -Dm 755 "$srcdir/rootlesskit" "$pkgdir/usr/bin/rootlesskit"
  install -Dm 755 "$srcdir/rootlesskit-docker-proxy" "$pkgdir/usr/bin/rootlesskit-docker-proxy"
  install -Dm 755 "$srcdir/rootlessctl" "$pkgdir/usr/bin/rootlessctl"
}
