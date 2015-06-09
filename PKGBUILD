# Maintainer: Raphael Scholer <rascholer@gmail.com>
pkgname=python-obpm
pkgver=2.0
pkgrel=3
pkgdesc="Python bindings for creating openbox pipe menus"
arch=('any')
url="http://github.com/rscholer/${pkgname}"
license=('MIT')
depends=('python')
conflicts=("${pkgname}-git")
makedepends=('python-setuptools')
optdepends=('alsa-utils: for alsa pipe menu'
            'exo: for opening applications'
            'python-moc: for mocp pipe menus'
            'python-pyalsaaudio: for alsa pipe menu'
            'python-setuptools: for running scripts'
)
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9f0ba6e8b0c82168f9f952e6f7e2630fc9d4033199ef0713f8a682464b3e22f0')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=2

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
# vim:set ts=2 sw=2 et:
