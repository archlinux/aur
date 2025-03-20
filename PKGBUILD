pkgname=python-dataclass-binder
pkgver=0.3.4
pkgrel=1
pkgdesc="Library to bind TOML data to Python dataclasses in a type-safe way."
arch=(any)
url="https://pypi.org/project/dataclass-binder"
license=(MIT)
makedepends=("python" "python-pip")
depends=("python")

build() {
  pip install --no-deps --target="dataclass-binder" dataclass-binder==$pkgver
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/dataclass-binder/* $pkgdir/"$sitepackages"
}
