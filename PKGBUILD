# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python2-cmp_version'
pkgver=3.0.0
pkgrel=1
pkgdesc="Python module to compare version numbers. Use this to compare the version strings of packages, modules, really anything."
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/cmp_version"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
optdepends=('cmp_version: The actual cmp-version tool')
source=("https://github.com/kata198/cmp_version/archive/${pkgver}.tar.gz")
sha512sums=('20a6e4d8885793ab742d441f45dd0516cd023232e4da93904169fcba67d106ae9fb3e00c11703fe82f9ccc6a80860b1a4a2090cd4dc0f36c708e7c5fdb1dd11a')

build() {
  cd "$srcdir"/cmp_version-$pkgver
  python2 setup.py build

}

package() {
  cd cmp_version-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  rm -Rf "${pkgdir}/usr/bin"
}
