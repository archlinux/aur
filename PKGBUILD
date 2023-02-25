# Maintainer: Deckweiss <Deckweiss75@gmail.com>

_name="arttime"
pkgname="${_name}-git"
pkgver=2.0.0.r453
pkgrel=2
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
  echo "$(git describe --tags $(git rev-list --tags --max-count=1)| grep -o '[0-9.]*'
).r$(git rev-list --count HEAD)"
}

package() {
    cd "$_name"
    ./install.sh --prefix "$pkgdir/usr/local/" --zcompdir "$pkgdir/usr/share/zsh/site-functions"
}
