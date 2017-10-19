# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyterlab
pkgver=0.28.0
pkgrel=1
pkgdesc="JupyterLab computational environment"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab"
license=(custom)
depends=(jupyterlab_launcher)
source=($pkgname-$pkgver.tar.gz::"https://github.com/jupyterlab/jupyterlab/archive/v$pkgver.tar.gz")
sha256sums=('89c3a656438b743d1bfd5731091fd3e916fc711ab55178797ff9aba468a087b2')

build() {
  cd $pkgname-$pkgver
  python setup.py build 
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
