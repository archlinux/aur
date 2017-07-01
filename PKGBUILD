# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyterlab
pkgver=0.24.1
pkgrel=1
pkgdesc="JupyterLab computational environment"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab"
license=(custom)
depends=(jupyter-notebook)
source=($pkgname-$pkgver::"https://github.com/jupyterlab/jupyterlab/archive/v$pkgver.tar.gz")
sha256sums=('1c8d408a6712704660d18d2902a34f63276856ed8be1fd3132b2f744d45889fd')

build() {
  cd $pkgname-$pkgver
  python setup.py build 
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
