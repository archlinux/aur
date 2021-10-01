# Maintainer: yjun <jerrysteve1101 at gmail dot com>

# fork from: https://aur.archlinux.org/packages/pyocd/

pkgname=pyocd-git
_pkgname=pyOCD
pkgver=v0.32.0.r4.g37c44ea1
pkgrel=1
pkgdesc="Python On Chip Debugger and programmer for ARM Cortex-M microcontrollers using CMSIS-DAP"
arch=('any')
url="https://github.com/pyocd/pyOCD"
license=('Apache')
depends=('python-capstone'
         'python-cmsis-pack-manager'
         'python-colorama'
         'python-intelhex'
         'python-intervaltree'
         'python-naturalsort'
         'python-prettytable'
         'python-pyelftools'
         'pylink'
         'pyocd-pemicro'
         'python-pyusb'
         'python-pyaml'
         'python-six'
         )
makedepends=('git'
             'python-setuptools')
provides=('pyocd')
conflicts=('pyocd')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}

