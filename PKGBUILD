# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Birks <david@tellus.space>
# Contributor: Victor Demonchy <demonchy.v@gmail.com>
# Contributor: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=kubetail
pkgver=1.6.18
pkgrel=1
pkgdesc='Tail Kubernetes logs from multiple pods'
arch=(any)
url='https://github.com/johanhaleby/kubetail'
license=(Apache)
depends=(
  bash
  kubectl
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('62ba29b3a869bba5b2ddf8c0fbbd307330dfe8cf8f3d47ae459c327b66afbb93')

_archive="$pkgname-$pkgver"

package() {
  cd "$_archive"

  install -Dm 755 kubetail "$pkgdir/usr/bin/kubetail"

  # Populate shell completions
  install -Dm 644 completion/kubetail.bash "$pkgdir/usr/share/bash-completion/completions/kubetail"
  install -Dm 644 completion/kubetail.zsh "$pkgdir/usr/share/zsh/site-functions/_kubetail"
  install -Dm 644 completion/kubetail.fish "$pkgdir/usr/share/fish/vendor_completions.d/kubetail.fish"
}
