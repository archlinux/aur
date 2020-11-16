# Maintainer: Niklas <dev@n1klas.net>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-sseclient
pkgver=0.0.27
pkgrel=1
pkgdesc="Client library for reading Server Sent Event streams"
arch=('any')
url="https://github.com/btubbs/sseclient"
license=('MIT')
depends=('python-requests>=2.0.0' 'python-six')
makedepends=('python-setuptools' 'git')
source=("git+${url}.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "$srcdir/sseclient"
    python setup.py build
}

package() {
  cd "$srcdir/sseclient"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
