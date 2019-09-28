# Maintainer: dszryan <9117127+dszryan@users.noreply.github.com>

pkgname=kubectx-git
pkgver=0.7.0
pkgrel=1
pkgdesc="kubens and kubectx tools combined"
arch=('x86_64')
url="https://github.com/ahmetb/kubectx"
optdepends=(
  'kubectl: check cluster status'
  'kubectl-bin: check cluster status - binary package'
)
license=('Apache')
source=("https://github.com/ahmetb/kubectx/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/kubectx-${pkgver}/kubens"                  -T "$pkgdir/usr/bin/kubens"
  install -Dm644 "$srcdir/kubectx-${pkgver}/completion/kubens.bash"  -T "$pkgdir/usr/share/bash-completion/completions/kubens"

  install -Dm755 "$srcdir/kubectx-${pkgver}/kubectx"                 -T "$pkgdir/usr/bin/kubectx"
  install -Dm644 "$srcdir/kubectx-${pkgver}/completion/kubectx.bash" -T "$pkgdir/usr/share/bash-completion/completions/kubectx"
}
