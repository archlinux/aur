# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyterlab_launcher
pkgver=0.4.0
pkgrel=1
pkgdesc="Launch an application built using JupyterLab"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab_launcher"
license=(custom)
depends=(jupyter-notebook)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/jupyterlab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('72ce7e0567ec1c9f171845132f1c4758e1dddd05fd69018b8eaf5974f0dfede0')

build() {
  cd $pkgname-$pkgver
  python setup.py build 
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
