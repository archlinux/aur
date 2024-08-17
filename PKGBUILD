# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='emborg'
pkgver=1.40
pkgrel=1
pkgdesc="Front-end to Borg backup"
arch=('any')
depends=('borg' 'python-appdirs' 'python-arrow' 'python-docopt'  'python-inform' 'python-nestedtext' 'python-quantiphy' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-flit-core')
url="https://github.com/KenKundert/${pkgname}"
license=('GPL3')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6991808241f0df3fbf275b40138e9271f93bc25fc2e59d623cec1a9ef0438f1c')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
