# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=nerdctl-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Docker-compatible CLI for containerd"
arch=('x86_64')
url="https://github.com/containerd/nerdctl"
license=('Apache')
optdepends=('containerd' 'rootlesskit' 'slirp4netns')
source=("https://github.com/containerd/nerdctl/releases/download/v${pkgver}/nerdctl-${pkgver}-linux-amd64.tar.gz")
sha256sums=('2d8dbe32cfcecf10964b5254a04c9e5057e6f4f62e7f070488c63ccb9d15dc2a')

package() {
  install -Dm 755 "$srcdir/nerdctl" "$pkgdir/usr/bin/nerdctl"
  install -Dm 755 "$srcdir/containerd-rootless-setuptool.sh" "$pkgdir/usr/bin/containerd-rootless-setuptool.sh"
  install -Dm 755 "$srcdir/containerd-rootless.sh" "$pkgdir/usr/bin/containerd-rootless.sh"
}
