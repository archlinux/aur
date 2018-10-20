# Maintainer: Guillaume Duboc <guilduboc@gmail.com>

pkgname=jupyterlab_launcher
pkgver=0.13.1
pkgrel=2
pkgdesc="Launch an application built using JupyterLab"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab_launcher"
license=(custom)
depends=(jupyter-notebook)
makedepends=(python-setuptools)
pkgservername=jupyterlab_server
source=($pkgname-$pkgver.tar.gz::"https://github.com/jupyterlab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ccd6ac15206822f03d2419d97fa7ed7e89c1a0efbe2351ebb1d5a98985e236d6')
build() {
  cd $pkgservername-$pkgver
  python setup.py build 
}

package() {
  cd $pkgservername-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
