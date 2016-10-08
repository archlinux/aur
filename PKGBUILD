# $Id: PKGBUILD 189446 2016-09-16 07:04:36Z felixonmars $
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-v4l2capture
pkgname=('python-v4l2capture')
pkgver=12.0.0
pkgrel=1
pkgdesc="Capture video with video4linux2"
arch=('i686' 'x86_64')
license=('custom')
url="https://launchpad.net/python-v4l2-capture"
makedepends=('python-setuptools')
depends=('python' 'v4l-utils')
source=("https://github.com/rmca/python-v4l2capture/archive/py3k.zip")
md5sums=('SKIP')
_dir=python-v4l2capture-py3k

prepare() {
  cd "$srcdir"/$_dir
  sed '/^Introduction/,$d' README > LICENSE
}

build() {
  cd "$srcdir"/$_dir
  python setup.py build
}

package() {
  cd $_dir
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
