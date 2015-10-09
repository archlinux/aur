# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=bmc
pkgver=0.6
pkgrel=1
pkgdesc="Simple script to download and store your articles."
arch=('any')
url="https://github.com/Phyks/BMC/"
license=('custom')
depends=('python' 'python-pypdf2' 'python-bibtexparser' 'python-socks' 'python-isbnlib' 'python-arxiv2bib')
makedepends=('python-setuptools')
sha256sums=('973af889da7682dd37c9f3908f019a5f69aa38e56ed4ae2efc09dd62c87b1dab')
source=(https://github.com/Phyks/BMC/archive/v$pkgver.zip)


build() {
  cd "$srcdir/BMC-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/BMC-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:ts=2:sw=2:et:
