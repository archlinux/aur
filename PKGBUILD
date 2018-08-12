# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyterlab_launcher
pkgver=0.13.1
pkgrel=1
pkgdesc="Launch an application built using JupyterLab"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab_launcher"
license=(custom)
depends=(jupyter-notebook)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/jupyterlab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('563879f5fd5836af5ef41cf252ccab2a5f9cb2291a90372504e2bf33e47d634e')

build() {
  cd $pkgname-$pkgver
  python setup.py build 
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
