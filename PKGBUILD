# Maintainer: Ravens Iris <liones121@gmail.com>
pkgname=deltamacs-git
pkgver=1.0
pkgrel=2
# epoch=
pkgdesc="My Emacs configuration, along with the required dependencies."
arch=(any)
url="https://github.com/Ravenirex/deltamacs"
license=('GPL')
depends=(emacs nerd-fonts-victor-mono)
makedepends=(git)
optdepends=(python clang cmake llvm rust-racer-git)
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
# install=install
# changelog=
source=("git+$url")
# noextract=()
md5sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd deltamacs
    mkdir -p $HOME/.emacs.d/deltamacs
    install init.el $HOME/.emacs.d
    install logo-small.png $HOME/.emacs.d
    install deltamacs/python-toolkit.el $HOME/.emacs.d/deltamacs
    install deltamacs/c-toolkit.el $HOME/.emacs.d/deltamacs
    install deltamacs/rust-toolkit.el $HOME/.emacs.d/deltamacs
}
