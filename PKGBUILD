# Maintainer: Ryszard Knop <rk@dragonic.eu>

pkgname=git-pile
pkgver=0.99
pkgrel=2
pkgdesc="Manage a pile of patches on top of a git branch"
url="https://github.com/git-pile/git-pile"
license=('LGPL')
arch=('any')
depends=('python' 'git')
optdepends=('python-argcomplete: bash autocompletion support')
makedepends=('python-setuptools')
source=("https://github.com/git-pile/git-pile/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d42767fa7c96fdbf3268ea174962e2fb059f51e7155c34db170f863620560b926d1cc7ed35d615e6e51155fd3256a04c717a2640c144e0c6483d11b49e108667')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
