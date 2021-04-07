#Maintainer: robertfoster

pkgname=pyvnc
pkgver=0.1
pkgrel=2
url="https://github.com/cair/pyVNC"
arch=(i686 x86_64)
license=(GPL)
pkgdesc="A Python wrapper for VNC client operations."
depends=('libvncserver')
makedepends=('python' 'python-distribute')
_commit=04fb3c02dbfd0cd491f2e66a6527814b524831f0
source=("${url}/archive/${_commit}.tar.gz")
sha256sums=('a2c0366fd32b50a0d81205fce206d6b377d6e59765bb1ad3f8e66541d9f8f829')

build() {
  cd "${srcdir}/pyVNC-${_commit}"
  python setup.py build
}

package() {
  cd "${srcdir}/pyVNC-${_commit}"
  python setup.py install --root="${pkgdir}"
}
