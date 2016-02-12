# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: abstracity <quarkin@gmail.com>

pkgname=archmage
pkgver=0.3.1
pkgrel=1
pkgdesc="An extensible reader and decompiler for files in the CHM format"
arch=('any')
url="https://github.com/dottedmag/archmage"
license=('GPL')
depends=('python2-pychm' 'python2-beautifulsoup4')
makedepends=('python2-setuptools' 'git')
optdepends=('lynx: for converting html to plain text'
            'elinks: for converting html to plain text'
            'htmldoc: for converting to single html and pdf formats'
            'mod_python: for apache/python integration')
backup=(etc/$pkgname/arch.conf)
source=($pkgname-$pkgver::git+https://github.com/dottedmag/archmage.git#tag=$pkgver)
sha256sums=('SKIP')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  python2 setup.py install --root="${pkgdir}"
}
