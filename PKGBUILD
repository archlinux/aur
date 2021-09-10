# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=nerdctl-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="Docker-compatible CLI for containerd"
arch=('x86_64')
url="https://github.com/containerd/nerdctl"
license=('Apache')
optdepends=('containerd' 'rootlesskit' 'slirp4netns')
source=("https://github.com/containerd/nerdctl/releases/download/v${pkgver}/nerdctl-${pkgver}-linux-amd64.tar.gz")
sha256sums=('aa85f3d9a0a44db437a04ad6e0cefa300b6ed8dee6d7f477eec9cb996efebc89')

package() {
  install -Dm 755 "$srcdir/nerdctl" "$pkgdir/usr/bin/nerdctl"
  install -Dm 755 "$srcdir/containerd-rootless-setuptool.sh" "$pkgdir/usr/bin/containerd-rootless-setuptool.sh"
  install -Dm 755 "$srcdir/containerd-rootless.sh" "$pkgdir/usr/bin/containerd-rootless.sh"
}
