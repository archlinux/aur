# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyterlab
pkgver=0.31.10
pkgrel=1
pkgdesc="JupyterLab computational environment"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab"
license=(custom)
depends=(jupyterlab_launcher)
source=($pkgname-$pkgver.tar.gz::"https://github.com/jupyterlab/jupyterlab/archive/v$pkgver.tar.gz")
sha256sums=('448393b9d36fe4178e66d33e246905ce7a2737aba93a069e71b8029ca1e3816e')

build() {
  cd $pkgname-$pkgver
  python setup.py build 
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
