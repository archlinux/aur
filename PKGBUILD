# Maintainer: Jiri Pinkava <j-pi at seznam.cz>

pkgname=kubeflow-kfctl
pkgver=1.2.0
_commit=d878d4d45863e42fd5cff6743294a11d28a9abce
pkgrel=1
pkgdesc="A tool to control and manage Kubeflow deployments"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/kubeflow/kfctl"
depends=('glibc')
makedepends=('go' 'git')
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kubeflow/kfctl/archive/v${pkgver}.tar.gz")
sha256sums=('a40116608f75b0b7e1d7c4d51af39ade877d85587edb32fd0dac7b43ec286d76')

build() {
  cd kfctl-${pkgver}
  make
}

package() {
  install -Dm755 "$srcdir/kfctl-${pkgver}/bin/kfctl" -T "$pkgdir/usr/bin/kfctl"
}
