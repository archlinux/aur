# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: abstracity <quarkin@gmail.com>

pkgname=archmage
pkgver=0.4.2.1
pkgrel=2
pkgdesc="An extensible reader and decompiler for files in the CHM format"
arch=('any')
url="https://github.com/dottedmag/archmage"
license=('GPL')
depends=('python-pychm' 'python-beautifulsoup4' 'python-sgmllib3k')
makedepends=('python-setuptools')
optdepends=('lynx: for converting html to plain text'
            'elinks: for converting html to plain text'
            'htmldoc: for converting to single html and pdf formats'
            'mod_python: for apache/python integration')
backup=(etc/$pkgname/arch.conf)
source=($pkgname-$pkgver::https://github.com/dottedmag/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('SKIP')

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  python setup.py install --root="${pkgdir}"
}
