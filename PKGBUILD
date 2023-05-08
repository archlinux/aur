pkgname=python-zm-py
pkgver=v0.5.2
_pypiname=${pkgname#python-}
pkgrel=1
pkgdesc="A loose python wrapper around the ZoneMinder REST API"
arch=(any)
url="https://github.com/rohankapoorcom/zm-py"
license=(Apache-2.0)
makedepends=("python" "python-pip")

build() {
  pip install --no-deps --target="${_pypiname}" ${_pypiname}==${pkgver}
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/${_pypiname}/* $pkgdir/"$sitepackages"
}
