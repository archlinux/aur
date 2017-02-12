# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=ghp-import
pkgver=0.5.4
pkgrel=1
pkgdesc="Copy your docs directly to the gh-pages branch."
arch=(any)
url="http://github.com/davisp/ghp-import"
license=(custom)
depends=(python2 python2-pyflakes python2-markdown)
makedepends=(python2-distribute)
changelog=Changelog
conflicts=(${pkgname}-git)
source=("https://pypi.python.org/packages/f5/cd/c780b2248dd364fdc77837a020bad3e176933d7ce5643217d9475465e871/${pkgname}-${pkgver}.tar.gz")
md5sums=('70417075b2e44c3bee768a2d6eb1a441')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  msg2 "Install LICENSE file at /usr/share/licenses/${pkgname}..."
  install -dm755         "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644  LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
