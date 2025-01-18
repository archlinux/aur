# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-xnatpy
_name=xnat
pkgver=0.6.2
pkgrel=1
pkgdesc="A new XNAT client that exposes XNAT objects/functions as python objects/functions."
arch=('any')
url="https://bitbucket.org/bigr_erasmusmc/xnatpy"
license=('Apache')
depends=('python' 'python-isodate' 'python-progressbar' 'python-click' 'python-requests' 'python-pydicom' 'python-dateutil' 'python-pyaml' 'python-click-option-group' 'python-importlib-metadata')
replaces=('xnatpy')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('0d580323a267e8c70f7d2d961830be4c3874e82429e3a93871df5c923acbb6c8')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

