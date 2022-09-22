# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=rootlesskit-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Linux-native 'fake root' for implementing rootless containers"
arch=('x86_64')
url="https://github.com/rootless-containers/rootlesskit"
license=('Apache')
optdepends=('containerd')
source=("rootlesskit-v${pkgver}-x86_64.tar.gz::https://github.com/rootless-containers/rootlesskit/releases/download/v${pkgver}/rootlesskit-x86_64.tar.gz")
sha256sums=('294f77ccff9f23456ee51a6837fc901dc8a48b5c2fbc7562995a1ae01fa3a3f6')
provides=('rootlesskit')
conflicts=('rootlesskit')

package() {
  install -Dm 755 "$srcdir/rootlesskit" "$pkgdir/usr/bin/rootlesskit"
  install -Dm 755 "$srcdir/rootlesskit-docker-proxy" "$pkgdir/usr/bin/rootlesskit-docker-proxy"
  install -Dm 755 "$srcdir/rootlessctl" "$pkgdir/usr/bin/rootlessctl"
}
