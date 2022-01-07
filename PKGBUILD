# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-app_paths
_name=${pkgname#python-}
pkgver=0.0.7
pkgrel=2
pkgdesc="Like appdirs, but with pathlib, path creation and async support."
arch=('any')
url="https://github.com/alexdelorenzo/app_paths"
license=('LGPL3')
depends=('python-strenum' 'python-aiopath' 'python-anyio' 'python-appdirs'
         'python-typing_extensions' 'python-unpackable' 'python-asyncstdlib')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/alexdelorenzo/app_paths/master/requirements.txt')
sha256sums=('0ae3f8a8d451539842d49124e173016671c1553e7df4e595cc8837041febf46f'
            'SKIP')

prepare() {
  cp requirements.txt "$_name-$pkgver"
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
