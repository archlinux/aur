# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=python-chardet-git
pkgver=2.3.0.r108.gec7aa57
pkgrel=1
pkgdesc='Python3 module for character encoding auto-detection (Git version)'
arch=('any')
url='https://github.com/chardet/chardet'
license=('LGPL')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-chardet')
provides=('python-chardet')
replaces=('python-chardet')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd chardet
  git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}


package() {
   cd chardet
   python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
