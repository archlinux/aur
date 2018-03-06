# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=('reprotest')
pkgver=0.7.7
pkgrel=2
pkgdesc="Run a process twice and check the output for reproducibility"
arch=('any')
license=('GPL2' 'GPL3')
url="https://anonscm.debian.org/cgit/reproducible/reprotest.git/"
depends=('python' 'python-rstr' 'diffoscope' 'fakeroot' 'python-distro')
optdepends=('disorderfs>=0.5.2' 'python-progressbar>=3.34.3-1')
source=(http://reproducible.alioth.debian.org/releases/reprotest/${pkgname}_${pkgver}.tar.xz{,.asc})
sha512sums=('b802d3614adacfd07f0c6cddab126af5fb621b9e2563e68d31634cb04ff402b4a5e688df27db95a8f1a70ea1e9f2c0f2fe22e5747cae3ece97846bc4c5c3a0a4'
            'SKIP')

validpgpkeys=("A405E58AB3725B396ED1B85C1318EFAC5FBBDBCE")

build() {
  cd "$srcdir/${pkgname}"
  python setup.py build
}

package() {
  depends=('python' 'python-setuptools')
  cd "$srcdir/${pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1
}
