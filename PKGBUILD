# Maintainer: rarick <tyler dot rarick at gmail dot com>

pkgname=tmux-plugin-manager-git
pkgver=v3.0.0.r69.gb699a7e
pkgrel=1
pkgdesc="tpm - Tmux Plugin Manager"
arch=('any')
_repo=tpm
url="https://github.com/tmux-plugins/$_repo"
license=('MIT')
conflicts=('tmux-plugin-manager')
depends=('tmux>=1.9' 'git' 'bash')
install=$pkgname.install
source=("git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd $_repo
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  echo "  -> Installing tpm..."
  install -dDm 755 "$pkgdir/usr/share/$pkgname"
  cp -r $_repo/* "$pkgdir/usr/share/$pkgname"
}
