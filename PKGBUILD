# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=python-git-up
pkgver=2.6.1
pkgrel=1
pkgdesc="A python implementation of git up"
arch=('any')
url="http://github.com/msiemens/PyGitUp"
license=('MIT')
depends=('python-termcolor' 'python-colorama' 'python-docopt' 'python-gitpython')
makedepends=('python-poetry' 'python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/msiemens/PyGitUp/archive/v$pkgver.tar.gz)
sha256sums=('eee0cc6532f257cdd8952ceede165cee4dde6f72430b4594031d4bbc6517d679')

prepare() {
  cd "PyGitUp-$pkgver"
}

build() {
  cd "PyGitUp-$pkgver"
  python -m build -nw
}

package() {
  cd "PyGitUp-$pkgver"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
