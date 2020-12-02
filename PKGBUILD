# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='shirah-reader'
pkgver=1.0.0
pkgrel=2
pkgdesc='Curses based terminal RSVP speed reader'
arch=('any')
url='https://github.com/Hallicopter/shirah-reader'
_url_pypi='https://pypi.org/project/shirah-reader'
license=('GPL')
depends=('python-beautifulsoup4' 'python-ebooklib' 'python-syllables' 'python-termcolor')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('88076d497d29f57230b9abbe3612b15ad2bae8d48b7a224ec11eb84983fa0abe')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
