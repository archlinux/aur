# Maintainer: Jonne Haß <me@mrzyx.de>
pkgname=oh-my-zsh-syntax-highlighting-git
pkgver=0.1.3.3.ge5d8a50
pkgrel=1
pkgdesc="ZSH syntax highlighting packaged for use with Oh My ZSH"
arch=('any')
url="https://github.com/zsh-users/zsh-syntax-highlighting"
license=('BSD')
depends=('zsh')
makedepends=('git')
source=('git://github.com/zsh-users/zsh-syntax-highlighting.git')
_repo='zsh-syntax-highlighting'

pkgver() {
  cd $_repo
  git describe --tags --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/oh-my-zsh/plugins"
  cp -a "$srcdir/$_repo" "$pkgdir/usr/share/oh-my-zsh/plugins/$_repo"
  rm -Rf "$pkgdir/usr/share/oh-my-zsh/plugins/$_repo/.git"
}
sha256sums=('SKIP')
