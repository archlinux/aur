# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=vim-apl
pkgname=$_pkgname-git
pkgver=r96.49142e9
pkgrel=1
pkgdesc="vim package for APL syntax and autocompletion"
arch=('any')
url="https://codeberg.org/ngn/vim-apl"
license=('GPL')
groups=('vim-plugins')
depends=('vim')
makedepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${pkgname%-git}::git+$url.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d $installpath/autoload/ $installpath/ftdetect $installpath/ftplugin $installpath/keymap $installpath/syntax
  install -Dm644 autoload/* $installpath/autoload/
  install -Dm644 ftdetect/* $installpath/ftdetect/
  install -Dm644 ftplugin/* $installpath/ftplugin/
  install -Dm644 keymap/* $installpath/keymap/
  install -Dm644 syntax/* $installpath/syntax/
}
