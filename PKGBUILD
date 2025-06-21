# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=webgui-jupyter-widgets
pkgname=python-${_base}-bin
pkgver=0.2.37
pkgrel=1
pkgdesc="Jupyter widgets library for webgui js visualization library"
arch=(any)
url="https://github.com/CERBSim/${_base}"
license=(LGPL-2.0-or-later)
depends=(python-ipywidgets)
makedepends=(python-installer)
provides=(python-${_base}=${pkgver})
conflicts=(python-${_base})
source=(https://pypi.org/packages/py2.py3/${_base::1}/${_base}/${_base//-/_}-${pkgver}-py2.py3-none-any.whl)
sha512sums=('bc5f81069674865011cc0b131e77d2300cccd99692c40c651df6ff9c05f46bc8ba0fd7003c29c73b8fa4796675a36e112b088edcbb15f1215e81c29c38a03d8a')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ${_base//-/_}-${pkgver}-py2.py3-none-any.whl
}