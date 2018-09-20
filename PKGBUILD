# Maintainer: Guillaume Duboc <guilduboc@gmail.com>

pkgname=jupyterlab_launcher
pkgver=0.2.0
pkgrel=1
pkgdesc="Launch an application built using JupyterLab"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab_launcher"
license=(custom)
depends=(jupyter-notebook)
makedepends=(python-setuptools)
pkgservername=jupyterlab_server
source=($pkgservername-$pkgver.tar.gz::"https://github.com/jupyterlab/$pkgservername/archive/v$pkgver.tar.gz")
sha256sums=('40544fdf685a92e324dac0493a7f3d744473af600508b75fb7f708c7585a20ae')

build() {
  cd $pkgservername-$pkgver
  python setup.py build 
}

package() {
  cd $pkgservername-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgservername/LICENSE
}
