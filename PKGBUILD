# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: thom wiggers
# Submitter: portaloffreedom

_pkgname=python_vlc
pkgname=python-vlc
pkgver=3.0.21203
pkgrel=2
pkgdesc="VLC bindings for python"
url="https://wiki.videolan.org/PythonBinding"
license=('LGPL-2.1-or-later')
arch=("any")
depends=('python' 'vlc')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('52d0544b276b11e58b6c0b748c3e0518f94f74b1b4cd328c83a59eacabead1ec')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
