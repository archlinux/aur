# Maintainer: Advaith Madhukar <advaith.madhukar at gmail dot com>
pkgname=('python-kiwi')
_pkgname='kiwi'
pkgver=9.23.43
pkgrel=2
pkgdesc="KIWI—Appliance Builder Next Generation"
license=('GPL3')
arch=('any')
url=https://github.com/OSInside/$_pkgname
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("bf6e2d20459ebb8a0d0659469dc4f20f7327becbf4691b3a8cc27e70d5f681b2")
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
depends=('python-requests' 'checkmedia' 'rpm-tools' 'zypper' 'python-yaml' 'python-pyxattr' 'python-lxml' 'python-docopt')

build(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
  make -C doc man
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"
}
