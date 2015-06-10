# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>
pkgname=sshrc-git
pkgver=20140919
pkgrel=1
pkgdesc="Bring your .bashrc, .vimrc, etc. from your local workstation when you ssh into a remote box."
arch=('any')
url="https://github.com/Russell91/sshrc"
license=('MIT')
depends=('openssh')
makedepends=('git')
source=("git://github.com/Russell91/sshrc.git")
md5sums=('SKIP')

_gitname="sshrc"

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
	cd "$srcdir/$_gitname"
  install -Dm 0755 sshrc "$pkgdir/usr/bin/sshrc"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
