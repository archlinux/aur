# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-mouseinfo
_name=MouseInfo
pkgver=0.1.3
pkgrel=2
pkgdesc="Display XY position and RGB color information for the pixel currently under the mouse."
arch=('any')
url="https://github.com/asweigart/mouseinfo"
license=('GPL-3.0-or-later')
depends=(
  'python-pillow'
  'python-pyperclip'
  'python-xlib'
  'tk'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2c62fb8885062b8e520a3cce0a297c657adcc08c60952eb05bc8256ef6f7f6e7')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
