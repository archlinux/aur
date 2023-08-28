# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: yochanamarqos

pkgname=python-torrentmirror
_name=${pkgname#python-}
pkgver=2.0.3
pkgrel=2
pkgdesc="Torrentmirror python library and CLI access"
arch=('any')
url="https://github.com/XayOn/torrentmirror"
license=('none')
depends=('python' 'python-robobrowser' 'python-cleo' 'python-werkzeug'
         'python-docopt' 'python-tabulate' 'python-xdg-base-dirs>=5.0.1' 'python-pygogo'
         'yapf')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bd0a55bbafd1d8b92769620c3573f95a7b07015fbcb2ee444dd6be3463ffa8ae')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
