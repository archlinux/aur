# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Birks <david@tellus.space>
# Contributor: Victor Demonchy <demonchy.v@gmail.com>
# Contributor: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=kubetail
pkgver=1.6.16
pkgrel=1
pkgdesc='Tail Kubernetes logs from multiple pods'
arch=('any')
url='https://github.com/johanhaleby/kubetail'
license=('Apache')
depends=('kubectl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/johanhaleby/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('24ab0205677a8a35405876076fdc410ed86217cd20e51b0c684f66914ea6fd16')

package() {
  cd $pkgname-$pkgver
  install -Dm 755 kubetail "$pkgdir/usr/bin/kubetail"

  # Populate shell completions
  install -Dm 644 completion/kubetail.bash "$pkgdir/usr/share/bash-completion/completions/kubetail"
  install -Dm 644 completion/kubetail.zsh "$pkgdir/usr/share/zsh/site-functions/_kubetail"
  install -Dm 644 completion/kubetail.fish "$pkgdir/usr/share/fish/vendor_completions.d/kubetail.fish"
}
