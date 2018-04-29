# Submitted by fenugrec 2018

_pkgbase='cmdebug'
pkgname="python-${_pkgbase}-git"
pkgver=r52.65e8b50
pkgrel=1
pkgdesc='Debug utilities for ARM Cortex-M microprocessors'
arch=('any')
url='https://github.com/posborne/cmsis-svd'
license=('GPL3')
depends=('python' 'python-lxml')
makedepends=('python-setuptools')
source=("${_pkgbase}::git+https://github.com/bnahill/PyCortexMDebug")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgbase}"
    python setup.py build
}

package() {
	cd "${srcdir}/${_pkgbase}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
