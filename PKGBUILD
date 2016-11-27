pkgname=spacemacs-git
pkgver=0.200.5
pkgrel=1
epoch=
pkgdesc="The best editor is neither Emacs nor Vim, it's Emacs and Vim!"
arch=('i686' 'x86_64')
url="http://spacemacs.org/"
makedepends=('emacs')
source=("git+https://github.com/syl20bnr/spacemacs.git")
md5sums=('SKIP')
pkgver() {
  cd spacemacs
  cat CHANGELOG.org | awk '{if (NR==2) print $2 }'
}

package() {
  cd spacemacs
  if [ ! -d ~/.emacs.d ]; then
    mkdir ~/.emacs.d
  fi
  cp -r * ~/.emacs.d
}
