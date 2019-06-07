# Maintainer: David Birks <david@tellus.space>

pkgname=kubetail
pkgver=1.6.8
pkgrel=1
pkgdesc='Tail Kubernetes logs from multiple pods'
arch=('any')
url='https://github.com/johanhaleby/kubetail'
license=('Apache')
depends=('kubectl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/johanhaleby/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('c6c7ffa54d6f5d28b8c3fa6a6a505827f0a0d4887d8376d6fc605b1bf7c8ae64')

package() {
  cd $pkgname-$pkgver
  install -Dm 755 kubetail "$pkgdir/usr/bin/kubetail"

  # Populate shell completions
  install -Dm 644 completion/kubetail.bash "$pkgdir/usr/share/bash-completion/completions/kubetail"
  install -Dm 644 completion/kubetail.zsh "$pkgdir/usr/share/zsh/site-functions/_kubetail"
  install -Dm 644 completion/kubetail.fish "$pkgdir/usr/share/fish/vendor_completions.d/kubetail.fish"
}
