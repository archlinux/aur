# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pysdd
_gitname="PySDD"
pkgver=0.2.10
pkgrel=2
pkgdesc="Python package for Sentential Decision Diagrams (SDD)."
arch=('any')
url="https://github.com/wannesm/PySDD/"
license=('Apache 2.0')
depends=('python' 'cython')
optdepends=('python-cysignals' 'python-numpy')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
#source=("https://files.pythonhosted.org/packages/9a/5d/0bc570dda1dec89de5c1b7954aede5e0690fd9baee282ce20a27cf69f700/${_pypiname}-${pkgver}.tar.gz")
#sha256sums=('ddeaca8a140e6c87c2f4f6d8b7e3260b5089e12fe7565d714523f66d233bb1d8')
source=("git+https://github.com/RenatoGeh/PySDD")
sha256sums=('SKIP')

prepare() {
  cd "${_gitname}"
  git checkout rand
  git pull
}

build() {
  #cd "$srcdir/${_pypiname}-${pkgver}"
  cd "${_gitname}"
  python3 setup.py build
}

package() {
  #cd "$srcdir/${_pypiname}-${pkgver}"
  cd "${_gitname}"
  python3 setup.py install --root="$pkgdir" --optimize=2 --skip-build
}
