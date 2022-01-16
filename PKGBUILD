# Maintainer: Danilo <aur ät dbrgn döt ch>
# Submitter: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=transifex-client
pkgver=0.14.4
pkgrel=1
pkgdesc="The Transifex command-line tool to download and upload translations from Transifex"
arch=('any')
url="http://pypi.python.org/pypi/transifex-client"
license=('GPL2')
depends=(
  'python-distribute'
  'python-urllib3'
  'python-six'
  'python-requests'
  'python-slugify'
  'python-gitpython'
)
source=("https://pypi.io/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('11dc95cefe90ebf0cef3749c8c7d85b9d389c05bd0e3389bf117685df562bd5c')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's#python-slugify<5.0.0#python-slugify#' requirements.txt
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
