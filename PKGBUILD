# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=nerdctl-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Docker-compatible CLI for containerd"
arch=('x86_64')
url="https://github.com/containerd/nerdctl"
license=('Apache')
optdepends=('containerd' 'rootlesskit' 'slirp4netns')
source=("https://github.com/containerd/nerdctl/releases/download/v${pkgver}/nerdctl-${pkgver}-linux-amd64.tar.gz")
sha256sums=('1371da3f6bd461f331946654f6dd3ef2ef4b9da0dd7bc5f78ed1166f32ad5adc')

package() {
  install -Dm 755 "$srcdir/nerdctl" "$pkgdir/usr/bin/nerdctl"
  install -Dm 755 "$srcdir/containerd-rootless-setuptool.sh" "$pkgdir/usr/bin/containerd-rootless-setuptool.sh"
  install -Dm 755 "$srcdir/containerd-rootless.sh" "$pkgdir/usr/bin/containerd-rootless.sh"
}
