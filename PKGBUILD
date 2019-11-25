# Maintainer: dront78

_pkgname=gols
pkgname=gols-git
pkgver=1.2.0
pkgrel=1
pkgdesc='Tool to syncronize Garmin devices with online service'
url='https://gols.readthedocs.io/'
license=('BSD')
source=('git+https://github.com/euri10/gols.git')
sha256sums=('SKIP')
arch=('any')
depends=('python' 'python-click' 'python-pytest' 'python-testfixtures' 'python-beautifulsoup4')
conflicts=('gols')
provides=('gols')

pkgver() {
  cd "${_pkgname}"
  echo ${pkgver}.`git rev-parse --short HEAD`
}

package() {
  cd ${srcdir}/${_pkgname}
  python setup.py install --root="$pkgdir/" --optimize=1
  cd ../..
}

# vim: ft=sh ts=2 sw=2 et

