# Maintainer: restitux <restitux@ohea.xyz>

_pkgname=av
pkgname=python-$_pkgname-bin
pkgver=14.1.0
pkgrel=1
pkgdesc="Pythonic bindings for FFmpeg's libraries (binary package)"
arch=('x86_64')
url="https://pyav.basswood-io.com/docs/stable/"
license=('BSD-3-Clause')
provides=('python-av')
conflicts=('python-av' 'python-av-git')
depends=('ffmpeg' 'python' 'python-numpy' 'python-pillow')
makedepends=('python-installer')
_py=cp313
_wheel_name=${_pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_$arch.manylinux2014_$arch.whl
source=(https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel_name)

sha256sums=('222303728d59edfbc241d7e944d5479d3bdfe98d33574a5e60aa7a23d54568fa')

package() {
  python -m installer --destdir="$pkgdir" $_wheel_name
}
