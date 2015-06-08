# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

pkgname=python2-gitpython
pkgver=1.0.1
pkgrel=1
pkgdesc="A python library used to interact with Git repositories"
arch=('any')
url="http://gitorious.org/git-python"
license=('BSD')
depends=('python2' 'git' 'python2-gitdb>=0.6.4')
makedepends=('python2' 'python2-distribute')
conflicts=('gitpython-git' 'gitpython')
replaces=('gitpython')
source=("http://pypi.python.org/packages/source/G/GitPython/GitPython-${pkgver}.tar.gz")
md5sums=('4659644b42c41e5e5170c0cd83ed6422')

package() {
  cd "$srcdir/GitPython-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1 || return 1
  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
