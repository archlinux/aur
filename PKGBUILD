# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Adam Goldsmith <adam@adamgoldsmith.name>
pkgbase=python-sarge
pkgname=('python-sarge' 'python2-sarge')
_name=sarge
pkgver=0.1.4
pkgrel=2
pkgdesc="The sarge package provides a wrapper for subprocess which provides command pipeline functionality."
arch=('any')
url="https://bitbucket.org/vinay.sajip/sarge"
license=('GPL')
makedepends=('python' 'python2')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('59f93216723ddd9062d17cbbb90ed9e69267b84825cf0bde0b7f8d934c424823')

prepare() {
  cp -a $_name-$pkgver{,-python2}
}

package_python-sarge() {
  depends=('python')
  conflicts=('python-sarge-git')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-sarge() {
  depends=('python2')
  conflicts=('python2-sarge-git')

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
