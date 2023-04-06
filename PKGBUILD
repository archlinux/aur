# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>

pkgname=python-pythondialog
pkgver=3.5.3
pkgrel=2
pkgdesc="Python package for interfacing with dialog"
url="http://pythondialog.sf.net"
arch=('any')
license=('LGPL')
depends=('python' 'dialog')
makedepends=('python-setuptools')
source=("https://downloads.sourceforge.net/project/pythondialog/pythondialog/$pkgver/python3-pythondialog-$pkgver.tar.bz2"{,.asc})
sha512sums=('69ae3e3894dbd56136989699fee7a7f459ce9a024e0e06d22193f5fd306f0f2bf2f4d300460f7de7898db347acdf6111652878948a78468a1aa23158c5f7ae98'
            'SKIP')
validpgpkeys=('125B5A0FDB788FDD0EF41A9DC785B90B5053A3A2') # Florent Rougon <f.rougon@free.fr>

build() {
  cd pythondialog-$pkgver
  python setup.py build
}

package() {
  cd pythondialog-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
