# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='inspektor'
pkgver=1.0.32
pkgrel=1
pkgdesc='View metadata information on files'
arch=('any')
url='https://github.com/hezral/inspektor'
license=('GPL3')
depends=('attr' 'gtk3' 'perl-image-exiftool' 'python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('41057ef4efb61a24cfb6cf70a2e45381542774635f5080803dba5ba0b5429444')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
