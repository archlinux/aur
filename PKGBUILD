# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=visidata
pkgver=1.5.1
pkgrel=1
pkgdesc='A terminal spreadsheet multitool for discovering and arranging data'
arch=('any')
url='http://visidata.org'
_url='https://github.com/saulpw/visidata/'
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-dateutil: for converting string column to datetime'
            'python-openpyxl: for opening .xlsx files'
            'python-h5py: for opening .hdf5 files'
            'python-google-api-python-client: for opening Google sheets')
provides=("visidata=${pkgver}")
conflicts=('visidata-git')
replaces=('visidata-git')
source=("${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('061e3e0fe156b1c3a18b555223cfa6e0f1bb0718cfc67eddddac1f910ab288df')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.gpl3 "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}

# vim:set ts=2 sw=2 et:
