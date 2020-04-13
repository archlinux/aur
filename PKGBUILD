# Maintainer: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
pkgname=emacsclient-desktop-git
pkgver=r2.5bdd031
pkgrel=1
pkgdesc="A desktop file for emacsclient."
arch=('x86_64' 'i686')
depends=('emacs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
url="https://github.com/hrehfeld/emacsclient-desktop"
source=("git+${url}.git")
noextract=()
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git checkout master
}

package() {
    install -Dm755 "$srcdir/${pkgname%-git}/emacsclient.desktop" "$pkgdir/usr/share/applications/emacsclient.desktop"
}
