# Maintainer: Bharadwaj Raju <bharadwaj.raju@keemail.me>
# Contributor: Daniel Sandman (shellkr) <revoltism+AUR$gmail.com>
# Contributor: doylefermi

pkgname=textsuggest-git
_gitname=${pkgname%-git*}
pkgver=r35.ccbcbc9
pkgrel=1
pkgdesc='Simple Linux utility to autocomplete words using rofi'
arch=('any')
url="https://github.com/bharadwaj-raju/TextSuggest"
license=('GPL3')
depends=('python' 'dbus-c++' 'qt5-base' 'xdotool' 'xclip' 'python-dbus')
makedepends=('git' 'gcc' 'make' 'automake')
provides=("$_gitname")
source=("$_gitname::git+https://github.com/bharadwaj-raju/TextSuggest.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_gitname"
	sh build.sh
	sh install.sh
}
