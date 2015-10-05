# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=python-git-up
pkgver=1.3.0
pkgrel=0
pkgdesc="A python implementation of git up"
arch=('any')
url="http://github.com/msiemens/PyGitUp"
license=('MIT')
makedepends=('python-setuptools' 'python-termcolor' 'python-colorama' 'python-docopt' 'python-gitpython')
source=(https://github.com/msiemens/PyGitUp/archive/v${pkgver}.tar.gz)
sha256sums=('9ea833ee6a52359813da82c7ca4f80db757691a271a1e62e5fb53d1b7bcb5e41')

package() {
  depends=('python-termcolor' 'python-colorama' 'python-docopt' 'python-gitpython')

  cd "${srcdir}"/PyGitUp-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1

#license
  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
