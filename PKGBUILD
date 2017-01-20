# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyterlab
pkgver=0.13.1
pkgrel=1
pkgdesc="JupyterLab computational environment"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab"
license=(custom)
depends=(jupyter-notebook)
source=($pkgname-$pkgver::"https://github.com/jupyterlab/jupyterlab/archive/v$pkgver.tar.gz")
sha256sums=('4d95b6ef7383e747a1c24cf417c8397916ec4c44e11d371fb55b8441355fb8f7')

build() {
  cd $pkgname-$pkgver
  python setup.py build 
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
