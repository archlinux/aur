# Maintainer: David Birks <david@tellus.space>
# Contributor: Victor Demonchy <demonchy.v@gmail.com>
# Contributor: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=kubetail
pkgver=1.6.9
pkgrel=1
pkgdesc='Tail Kubernetes logs from multiple pods'
arch=('any')
url='https://github.com/johanhaleby/kubetail'
license=('Apache')
depends=('kubectl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/johanhaleby/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b8a22d9a0aeb3587f7c32ebcd0ddc73ea62bffb67a591ec833e182b63fb6b2c0')

package() {
  cd $pkgname-$pkgver
  install -Dm 755 kubetail "$pkgdir/usr/bin/kubetail"

  # Populate shell completions
  install -Dm 644 completion/kubetail.bash "$pkgdir/usr/share/bash-completion/completions/kubetail"
  install -Dm 644 completion/kubetail.zsh "$pkgdir/usr/share/zsh/site-functions/_kubetail"
  install -Dm 644 completion/kubetail.fish "$pkgdir/usr/share/fish/vendor_completions.d/kubetail.fish"
}
