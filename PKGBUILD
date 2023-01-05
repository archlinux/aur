# Maintainer: Ryszard Knop <rk@dragonic.eu>

pkgname=git-pile
pkgver=1.1
pkgrel=1
pkgdesc="Manage a pile of patches on top of a git branch"
url="https://github.com/git-pile/git-pile"
license=('LGPL')
arch=('any')
depends=('python' 'git')
optdepends=(
  'python-argcomplete: bash autocompletion support'
  'b4: replacement for git-mbox-prepare'
)
makedepends=('python-setuptools')
source=("https://github.com/git-pile/git-pile/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('06bccdcfd32da3845bb64472bce1f5b91dbe8fafd1eda211efc9d97d2e4a4061dccda186c218878233b50e6a396044d9558f4a92ce88f558d1cc259a8f74c102')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
