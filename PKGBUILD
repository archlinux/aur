# Contributor: Patrick Mischke

pkgname='python-pairinteraction'
_name='pairinteraction'
_py="py3"
pkgver=2.2.2
commit="e0c50b6581926aa87f07a55876f4e6e56b07a4b3"
pkgrel=1
pkgdesc="A Rydberg Interaction Calculator"
url="https://github.com/pairinteraction/pairinteraction"
depends=('python-typing_extensions' 'python-numpy' 'python-scipy' 'python-pint' 'python-colorama' 'pyside6' 'python-matplotlib' 'python-mplcursors' 'python' 'intel-oneapi-mkl' 'python-mkl' 'nlohmann-json' 'doctest' 'eigen' 'fmt' 'openssl' 'spdlog' 'cpptrace' 'jupyter-nbformat' 'jupyter-nbconvert')
makedepends=('cmake' 'python-scikit-build-core' 'nanobind' 'python-pip')
license=('GPL-3.0-only' 'LGPL-3.0-only')
arch=('x86_64')
options=('!buildflags' 'staticlibs' '!strip' 'libtool')
# every once in a while an actual release is build and we can grab that
#source=("https://github.com/pairinteraction/pairinteraction/archive/refs/tags/v$pkgver.tar.gz")
# otherwise we just use the zip of whatever commit I updated this last
 source=("https://github.com/pairinteraction/pairinteraction/archive/$commit.zip")

sha256sums=("fdd2d6dccb8fb52ab139f1cbef774cc28823b68829a434f6c4385fadcbf2afaa")


package() {
#  cd "$srcdir/pairinteraction-$pkgver"
  cd "$srcdir/pairinteraction-$commit"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}

#check() {
#  pairinteraction test
#}
