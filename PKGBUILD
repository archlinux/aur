# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>
pkgname=sshrc-git
pkgver=20200605
pkgrel=1
pkgdesc="Bring your .bashrc, .vimrc, etc. from your local workstation when you ssh into a remote box."
arch=('any')
url="https://github.com/cdown/sshrc"
license=('MIT')
depends=('openssh')
makedepends=('git')
source=("${pkgname}::git+https://github.com/cdown/sshrc.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 0755 sshrc "$pkgdir/usr/bin/sshrc"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
