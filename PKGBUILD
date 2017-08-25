# $Id$
# Maintainer: Musee Ullah <lae@lae.is>

pkgbase=python-lyra2re_hash
pkgname=(python-lyra2re_hash python2-lyra2re_hash)
_reponame=lyra2re-hash-python
_reporef=6677dd3a6b3ebb7e6ef76d08311d5b8580cdec26
pkgver=1.1
pkgrel=1
pkgdesc="Python module for Lyra2RE."
arch=("any")
url="https://github.com/metalicjames/lyra2re-hash-python"
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/metalicjames/${_reponame}/archive/${_reporef}.tar.gz")
sha512sums=('91cb3499a76b93d75e18d2c4069a41088515ebc5ff0760afe4e37a173bc310df3760b8c93701a3e5780cdb0ca6db404e79de3c2b7f623a1a1aecc9f69716a5ae')

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
