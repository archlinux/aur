# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=gdown
pkgver=4.2.0
pkgrel=1
pkgdesc="Download a large file from Google Drive"
arch=('any')
url="https://github.com/wkentaro/gdown"
license=('MIT')
depends=('python' 'python-tqdm' 'python-filelock' 'python-pysocks' 'python-six' 'python-beautifulsoup4')
makedepends=('python-setuptools' 'git')
source=(git+https://github.com/wkentaro/gdown.git#tag=v${pkgver})
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}"

  git submodule update --init
}

build() {
  cd "${pkgname}"

  python setup.py build
}

package() {
  cd "${pkgname}"

  python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
  install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
# vim:set ts=2 sw=2 et:
