# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Birks <david@tellus.space>
# Contributor: Victor Demonchy <demonchy.v@gmail.com>
# Contributor: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=kubetail
pkgver=1.6.19
pkgrel=1
pkgdesc="Tail Kubernetes logs from multiple pods"
arch=(any)
url="https://github.com/johanhaleby/kubetail"
license=(Apache-2.0)
depends=(
  bash
  kubectl
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('441e0ff5bb1e7884d6458366d72e848f1088825c5d615bbfe96d953990606d9a')

_archive="$pkgname-$pkgver"

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" kubetail

  # Populate shell completions
  install -Dm644 completion/kubetail.bash "$pkgdir/usr/share/bash-completion/completions/kubetail"
  install -Dm644 completion/kubetail.zsh "$pkgdir/usr/share/zsh/site-functions/_kubetail"
  install -Dm644 completion/kubetail.fish "$pkgdir/usr/share/fish/vendor_completions.d/kubetail.fish"
}
