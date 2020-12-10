# Maintainer: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>
# Original Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-pyarrow-bin
_pyname=pyarrow
pkgname=('python-pyarrow-bin')
depends=(
  'python>=3.8.0'
  'python<3.9.0' # https://github.com/apache/arrow/pull/8386
  'python-numpy'
)
conflicts=('python-pyarrow')
replaces=('python-pyarrow')
makedepends=('python-pip')
pkgver=2.0.0
pkgrel=1
pkgdesc="Python library for Apache Arrow"
arch=('any')
url="Python library for Apache Arrow"
license=('Apache V2')
source=("https://files.pythonhosted.org/packages/7c/93/23e304a4238d3e776e0ab43dfd4a78f602c8f51ef0c1adca97477f63161e/pyarrow-${pkgver}-cp38-cp38-manylinux2014_x86_64.whl")
md5sums=('6091b93580cdd8c7db263f1774eb112b')


package() {
  cd "${srcdir}"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location pyarrow-${pkgver}-cp38-cp38-manylinux2014_x86_64.whl 
}

# vim:set et sw=2 ts=2 tw=79:
