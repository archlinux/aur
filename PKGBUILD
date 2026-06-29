# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='emborg'
pkgver=1.43
pkgrel=1
pkgdesc="Front-end to Borg backup"
arch=('any')
depends=('borg' 'python-appdirs' 'python-arrow' 'python-docopt'  'python-inform' 'python-nestedtext' 'python-quantiphy' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-flit-core')
url="https://github.com/KenKundert/${pkgname}"
license=('GPL3')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3685324be811b402940318c3cf310b27e6dfba236ed94efcbe2784729b582719')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
