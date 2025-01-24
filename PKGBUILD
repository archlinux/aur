# Maintainer: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
_pkgname=emacsclient-default-directory
pkgbase="$_pkgname"
pkgname="$_pkgname-git"
pkgver=r2.6bf6ce6
pkgrel=1
pkgdesc="Pass PWD to emacsclient via frame-parameters and set default-directory"
arch=(any)
_repo_name="emacs-$_pkgname"
url="https://github.com/hrehfeld/${_repo_name}"
depends=('emacs')
license=(GPL-3.0)
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
sha256sums=('SKIP')
noextract=()

pkgver() {
	cd "$srcdir/${_repo_name}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd $srcdir/$_repo_name
	install -Dm755 "emacsclient-default-directory" "$pkgdir/usr/bin/emacsclient-default-directory"
	install -Dm644 "emacsclient-default-directory.el" "$pkgdir/usr/share/emacs/site-lisp/emacsclient-default-directory.el"
}
