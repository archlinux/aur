# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=nota.zsh-git
_pkgname=nota.zsh
pkgver=1.0.0
pkgrel=1
pkgdesc='ZSH plugin that help you record notas with some context.'
arch=('any')
url="https://github.com/0x61nas/nota.zsh"
license=('MIT')
depends=('zsh' 'fzf')
optdepends=()
conflicts=("$_pkgname")
options=()
source=("$_pkgname::git+$url.git#branch=aurora")
sha256sums=(SKIP)
# validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_pkgname"
    install -Dm755 nota.zsh "$pkgdir/usr/share/zsh/plugins/nota/nota.zsh"
}
