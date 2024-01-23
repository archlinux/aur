_pipname=git-dummy
pkgname=python-git-dummy
pkgver=0.1.2
pkgrel=1
pkgdesc='Generate dummy Git repositories populated with the desired number of commits, branches, and structure.'
arch=(any)
url='https://pypi.org/project/git-dummy/'
license=(MIT)
depends=(python-typer python-gitpython python-pydantic-settings)
makedepends=(python-setuptools)
source=("https://pypi.io/packages/source/g/git-dummy/git-dummy-${pkgver}.tar.gz")
sha256sums=('1948ccc8725f11689a3eefddfd1917df1ed6f199290906bf1d1246cd38c03765')

build() {
  cd "$srcdir/${_pipname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pipname}-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
