# Maintainer: rarick <tyler dot rarick at gmail dot com>

pkgname=tmux-plugin-manager-git
pkgver=v3.0.0.r69.gb699a7e
pkgrel=1
pkgdesc="tpm - Tmux Plugin Manager"
arch=('any')
_repo=tpm
url="https://github.com/tmux-plugins/$_repo"
license=('MIT')
makedepends=('git')
depends=('tmux>=1.9' 'bash')
install=$pkgname.install
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_repo
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  echo "  -> Installing tpm..."
  install -dDm 755 "$pkgdir/usr/share/$pkgname"
  cp -r $_repo/* "$pkgdir/usr/share/$pkgname"
}
