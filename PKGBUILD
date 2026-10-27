# Maintainer: David Birks <david@birks.dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Victor Demonchy <demonchy.v@gmail.com>
# Contributor: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=kubetail
pkgver=1.6.22
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
sha256sums=('1b58fa4a2068dcb091b76b1e29e68039a76de50efd37400461e24f61fdc59b1b')

_archive="$pkgname-$pkgver"

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" kubetail

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 completion/kubetail.bash "$pkgdir/usr/share/bash-completion/completions/kubetail"
  install -Dm644 completion/kubetail.zsh "$pkgdir/usr/share/zsh/site-functions/_kubetail"
  install -Dm644 completion/kubetail.fish "$pkgdir/usr/share/fish/vendor_completions.d/kubetail.fish"
}
