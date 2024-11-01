# Maintainer: therealmate <hellogaming91 at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=python-pyfluidsynth
pkgver=1.3.3
pkgrel=1
pkgdesc="Python bindings for FluidSynth"
arch=('any')
url="https://github.com/nwhitehead/pyfluidsynth"
license=('LGPL-2.1-only')
provides=('pyfluidsynth')
conflicts=('pyfluidsynth')
replaces=('pyfluidsynth')
depends=(
  'fluidsynth'
  'python-numpy'
  'python'
)
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/p/pyFluidSynth/pyFluidSynth-$pkgver.tar.gz)
sha256sums=('d50d4b55073e7580b2a3ca470992b6c51c279dba1c5512dc85135595f42d6881')

build() {
	cd "$srcdir/pyFluidSynth-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/pyFluidSynth-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
