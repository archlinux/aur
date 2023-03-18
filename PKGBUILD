# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

_modname=setuptools_scm_git_archive
pkgname=python-${_modname//_/-}
pkgver=1.4
pkgrel=1
pkgdesc="setuptools_scm plugin for git archives"
arch=('any')
url=https://github.com/Changaco/setuptools_scm_git_archive/
license=('MIT')
depends=('python' 'python-setuptools-scm')
makedepends=('python-setuptools')
#source=("https://github.com/Changaco/setuptools_scm_git_archive/archive/${pkgver}.tar.gz")
source=("git+https://github.com/Changaco/setuptools_scm_git_archive.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/${_modname}"
  python setup.py build
}


package(){
  cd "$srcdir/${_modname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
