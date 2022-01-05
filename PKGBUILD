# Maintainer: lxgr <lxgr@protonmail.com>

pkgbase=scrap_engine-git
pkgname=python-scrap_engine-git
pkgver=1.2.0
pkgrel=1
arch=(any)
url="https://github.com/lxgr-linux/scrap_engine"
license=('GPL3')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-wheel')
provides=('python-scrap_engine')
pkgdesc="Python scrap_engine module"
source=("$pkgbase"::'git+https://github.com/lxgr-linux/scrap_engine')
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/$pkgbase"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/scrap_engine/LICENSE"
}
