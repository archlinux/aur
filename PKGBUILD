# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgbase=python-diff-match-patch
pkgname=('python-diff-match-patch' 'python2-diff-match-patch')
pkgver=20121119
pkgrel=1
pkgdesc="Robust algorithms to perform the operations required for synchronizing plain text"
arch=('any')
license=('Apache')
url="http://code.google.com/p/google-diff-match-patch/"
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/d/diff-match-patch/diff-match-patch-${pkgver}.tar.gz")
md5sums=('08e02cad82dda942b09ee248772fe143')

prepare() {
  cd "${srcdir}/diff-match-patch-${pkgver}"

  sed -i 's/\/usr\/bin\/python2.4/\/usr\/bin\/python2.7/' python2/diff_match_patch/*
}

package_python-diff-match-patch() {
  depends=('python')

  cd "${srcdir}/diff-match-patch-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
}

package_python2-diff-match-patch() {
  depends=('python2')

  cd "${srcdir}/diff-match-patch-${pkgver}"

  rm -rf build # Installs python3 version otherwise
  python2 setup.py install --root="${pkgdir}" -O1
}
