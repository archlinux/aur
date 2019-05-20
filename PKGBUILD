# $Id$
# Maintainer: Musee Ullah <lae@lae.is>

pkgbase=python-lyra2re_hash
pkgname=(python-lyra2re_hash python2-lyra2re_hash)
_reponame=lyra2re-hash-python
_reporef=639567bf3674730362fafbb8ae90c35bcf94b42a
pkgver=1.2.1
pkgrel=1
pkgdesc="Python module for Lyra2RE."
arch=("any")
url="https://github.com/metalicjames/lyra2re-hash-python"
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/metalicjames/${_reponame}/archive/${_reporef}.tar.gz")
sha512sums=('65dd2c23471cc4bce59c075c896b550ddc4177d0e78a01e6ba33f3b1fb8eb5ba5bac75b6997566831f1e4700bd20964262b822c262837f0bc1e3d85dc90118eb')

prepare() {
  cp -a ${srcdir}/${_reponame}-${_reporef}{,-py2}
}

build_python-lyre2re_hash() {
  cd ${srcdir}/${_reponame}-${_reporef}
  python setup.py build
}

build_python2-lyre2re_hash() {
  cd ${srcdir}/${_reponame}-${_reporef}-py2
  python2 setup.py build
}

package_python-lyra2re_hash() {
  depends=('python')

  cd ${srcdir}/${_reponame}-${_reporef}
  python setup.py install --root="$pkgdir"
}

package_python2-lyra2re_hash() {
  depends=('python2')

  cd ${srcdir}/${_reponame}-${_reporef}-py2
  python2 setup.py install --root="$pkgdir"
}
