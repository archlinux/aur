# Maintainer:  Christian Holme <hcmh (at) kolabnow (dot) com>

_name=pyseus
pkgname=${_name}-git
pkgver=v1.0.r47.g6067211
pkgrel=1
pkgdesc="A simple viewer for MRI data"
arch=('any')
url="https://github.com/IMTtugraz/PySeus"
license=('MIT')
depends=('python>=3.5' 'python-pytest' 'python-mock' 'flake8' 'python-pylint' 'python-sphinx' 'python-sphinx_rtd_theme' 'pyside2' 'python-numpy' 'python-scipy' 'python-opencv' 'python-h5py' 'python-pydicom' 'python-nibabel' 'python-natsort')
makedepends=('python-setuptools' 'git')
source=("pyseus::git+https://github.com/IMTtugraz/PySeus.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

package() {
  cd "$_name"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
