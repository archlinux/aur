# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=ghp-import
pkgver=0.3.2
pkgrel=1
pkgdesc="Copy your docs directly to the gh-pages branch."
arch=(any)
url="http://github.com/davisp/ghp-import"
license=(custom)
depends=(python2)
makedepends=(python2-distribute)
changelog=Changelog
conflicts=(${pkgname}-git)
source=("http://pypi.python.org/packages/source/g/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('67821089a324533d719eadf10cc31c1e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  msg2 "Install LICENSE file at /usr/share/licenses/${pkgname}..."
  install -dm755         "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644  LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
