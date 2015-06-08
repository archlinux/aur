# Maintainer: abilke <andreas@bilke.org>

pkgname=python-powerlaw-git
pkgrel=1
pkgver=r1.3.4.60cd80d
pkgdesc='A Python Package for Analysis of Heavy-Tailed Distributions'
arch=('any')
url='https://github.com/jeffalstott/powerlaw'
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
optdepends=('python-mpmath: support for gamma function fitting')
makedepends=('git' 'awk' 'sed')
license=('MIT')
md5sums=('SKIP')

source=("$pkgname::git+https://github.com/jeffalstott/powerlaw.git")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" $(awk '/version= / { print $2 }' setup.py | sed "s/[',]//g") $(git rev-parse --short HEAD)
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/"
}
