# Maintainer: Ryszard Knop <rk@dragonic.eu>

pkgname=git-pile
pkgver=1.0
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
sha512sums=('5e1eed27e5d962463bc805bb7addffc2411ac601d4e7007f70c6636a5c53d4f9ac4032d31138b678734753594d3a1d66eb9badbbfb16655b82ccf608ef933e60')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
