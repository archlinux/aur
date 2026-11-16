# Contributor: Patrick Mischke

pkgname='python-pairinteraction'
_name='pairinteraction'
_py="py3"
pkgver=2.6.0
#commit="e0c50b6581926aa87f07a55876f4e6e56b07a4b3"
pkgrel=1
pkgdesc="A Rydberg Interaction Calculator"
url="https://github.com/pairinteraction/pairinteraction"
depends=('python-typing_extensions' 'python-numpy' 'python-scipy' 'python-pint' 'python-colorama' 'pyside6' 'python-matplotlib' 'python-mplcursors' 'python' 'intel-oneapi-mkl' 'python-mkl' 'nlohmann-json' 'doctest' 'eigen' 'fmt' 'openssl' 'spdlog' 'cpptrace' 'jupyter-nbformat' 'jupyter-nbconvert')
makedepends=('cmake' 'python-scikit-build-core' 'nanobind' 'python-pip')
checkdepends=('python-pytest-qt')
license=('GPL-3.0-only' 'LGPL-3.0-only')
arch=('x86_64')
options=('!buildflags' 'staticlibs' '!strip' 'libtool')
# every once in a while an actual release is build and we can grab that
source=("https://github.com/pairinteraction/pairinteraction/archive/refs/tags/v$pkgver.tar.gz")
# otherwise we just use the zip of whatever commit I updated this last
# source=("https://github.com/pairinteraction/pairinteraction/archive/$commit.zip")

sha256sums=("d0e6b4d953b77c305ecd755198c67be18b5b2992bd08eee0c78bae45e0e64564")


package() {
  cd "$srcdir/pairinteraction-$pkgver"
#  cd "$srcdir/pairinteraction-$commit"
MAKEFLAGS="-j2" PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}

#check() {
#  pairinteraction test
#}
