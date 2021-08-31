# Contributor: Patrick Mischke

pkgname='python-pairinteraction'
_name='pairinteraction'
_py="py3"
pkgver=0.9.7a0
pkgrel=2
pkgdesc="A Rydberg Interaction Calculator"
url="https://github.com/pairinteraction/pairinteraction"
depends=('python-numpy' 'python-scipy' 'python-pint' 'python-psutil' 'boost-libs' 'sqlite' 'gsl' 'swig')
makedepends=('python-pip')
license=('GPL3' 'LGPL3')
arch=('x86_64')
options=('!buildflags' 'staticlibs' '!strip' 'libtool')
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/8a/f0/53057d5cd8e532091767f63139dbb2d4806549c97200c476854f4f3cd0c1/pairinteraction-0.9.7a0-py3-none-manylinux2010_x86_64.whl")
sources=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$name-$pkgver-$_py-none-manylinux2010_x86_64.whl")

sha256sums=('d6ccf4e8b186f13b452bf4b697342fe862b54335ea4f92a2a96a5b55716a394a')

package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
