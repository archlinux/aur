# Maintainer: aksr <aksr at t-com dot me>
pkgname=migemogrep-git
pkgver=0.1.0.40.ge257f9e
pkgrel=1
epoch=
pkgdesc="Search/grep against Japanese text using latin-1 text."
arch=('i686' 'x86_64')
url="https://github.com/peco/migemogrep"
license=('MIT')
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=('vim: for migemogrep.vim plugin')
checkdepends=()
provides=('migemogrep')
conflicts=('migemogrep')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/peco/migemogrep

build() {
  cd "$srcdir/"
  GOPATH="$srcdir" go get -v -x ${_gourl}
}

package() {
  cd "$srcdir/"
  install -Dm755 bin/migemogrep $pkgdir/usr/bin/migemogrep
  cd "src/github.com/peco/migemogrep/"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 misc/vim/plugin/migemogrep.vim $pkgdir/usr/share/vim/vimfiles/plugin/migemogrep.vim
}

