pkgname=python-pysma
pkgver=0.7.5
_pypiname=${pkgname#python-}
pkgrel=1
pkgdesc="Async library for SMA Solar's WebConnect interface"
arch=(any)
url="https://github.com/kellerza/pysma"
license=(Apache-2.0)
makedepends=("python" "python-pip")
depends=("python-jmespath")

build() {
  pip install --no-deps --target="${_pypiname}" ${_pypiname}==${pkgver}
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/${_pypiname}/* $pkgdir/"$sitepackages"
}
