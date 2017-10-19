# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyterlab_launcher
pkgver=0.5.5
pkgrel=1
pkgdesc="Launch an application built using JupyterLab"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab_launcher"
license=(custom)
depends=(jupyter-notebook)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/jupyterlab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('bab779dde57454b4b15a1c9b246aaed6216919e56205ea99daf3f124d830b103')

build() {
  cd $pkgname-$pkgver
  python setup.py build 
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
