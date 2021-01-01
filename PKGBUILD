# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=git-completion
pkgver=1.3
pkgrel=1
pkgdesc='Git completions for Zsh and Bash'
url='https://github.com/felipec/git-completion'
arch=('any')
license=('GPLv2')
makedepends=('git')
source=("git-completion::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

check() {
  cd git-completion &&
  make test
}

package() {
  cd git-completion &&
  # TODO find a better location than /usr/local/share
  DESTDIR="$pkgdir" make \
	  zshfuncdir=/usr/share/zsh/site-functions \
	  completionsdir=/usr/local/share/bash-completion/completions \
	  sharedir=/usr/share/git-completion \
	  install
}
