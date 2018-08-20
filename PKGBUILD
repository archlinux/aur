# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=visidata
pkgver=1.3.1
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
source=("${_url}/archive/v.${pkgver}.tar.gz")
sha256sums=('387837ed440a10c97fb139a7e1921d347ee8c30f578742266e0fb530b8ec5ecc')

package() {
  cd "${srcdir}/${pkgname}-v.${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.gpl3 "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
