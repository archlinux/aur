# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_project=pyjacklib
pkgname=python-$_project
pkgdesc='Python bindings for libjack using ctypes'
pkgver=0.1.1
pkgrel=2
arch=(any)
url='https://github.com/jackaudio/pyjacklib'
license=(GPL)
depends=(jack python)
makedepends=(python-setuptools)
groups=(pro-audio)
source=("https://files.pythonhosted.org/packages/source/${_project::1}/$_project/$_project-$pkgver.tar.gz")
sha256sums=('b940bd782752a5fc221419a426c366c7b644be341dc665b0ad26fca4a00f966f')

build() {
  cd $_project-$pkgver
  python setup.py build
}

package() {
  cd $_project-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
