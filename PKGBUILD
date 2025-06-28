# Maintainer: tuximail (admin [at] tuximail [dot] de)
#
pkgname=python-fasttext-numpy2
pkgdesc="fasttext with one line changed to support numpy 2"
url="https://github.com/simon-ging/fasttext-numpy2"
provides=("python-fasttext-numpy2")
conflicts=("python-fasttext")
pkgver=0.10.4
pkgrel=1
arch=('x86_64')
license=('MIT')
options=(!debug)

makedepends=('python-setuptools')
depends=('pybind11' 'python-numpy' 'python-scipy' 'python-pytorch')

source=(
  "${pkgname[0]}-git::git+https://github.com/simon-ging/fasttext-numpy2.git#commit=baf99646904e34cd2277e63dc0f1be5621c49b73"
)
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname[0]}-git"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname[0]}-git"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
}
