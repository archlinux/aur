# Maintainer: Deckweiss <Deckweiss75@gmail.com>

_name="arttime"
pkgname="${_name}-git"
pkgver=1.0.453
pkgrel=1
pkgdesc="Arttime brings curated text-art to otherwise artless terminal emulators of starving developers and other users who can use terminal."
arch=('any')
url="https://github.com/poetaman/${_name}"
license=('GPLv3')
depends=(
    'zsh'
)
makedepends=(
    'zsh'
)
conflicts=(${_name})
provides=(${_name})
source=("git+https://github.com/poetaman/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  printf "1.0.%s" "$(git rev-list --count HEAD)"
}

package() {
    cd "$_name"
    ./install.sh --prefix "$pkgdir/usr/local/" --zcompdir "$pkgdir/usr/share/zsh/site-functions"
}
