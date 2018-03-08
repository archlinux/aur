# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=visidata
pkgver=1.1
pkgrel=1
pkgdesc='A terminal spreadsheet multitool for discovering and arranging data'
arch=('any')
url='http://visidata.org'
_url='https://github.com/saulpw/visidata/'
license=('GPLv3')
depends=('python')
optdepends=('python-dateutil: for converting string column to datetime'
            'python-openpyxl: for opening .xlsx files'
            'python-h5py: for opening .hdf5 files'
            'python-google-api-python-client: for opening Google sheets')
provides=("visidata=${pkgver}")
conflicts=('visidata-git')
replaces=('visidata-git')
source=("${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('55cafd91e9729f5dbaa76e3cf37a3fbb2975b5fb4425682004f380594a96ca60')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
