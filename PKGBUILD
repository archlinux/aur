# Maintainer: Ryszard Knop <rk@dragonic.eu>

pkgname=git-pile
pkgver=1.2
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
sha512sums=('bb43869f7be96a75f014fc8a71c5a7757deab40182401216408962bfd0406b40714e31007026265226833b133a92ac552e7a7edc6de661414e9cd3945c083496')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
