# Maintainer: Dino Duratović <dinomol  mail  com>
pkgname=obquit-git
pkgver=r59.f84aa4e
pkgrel=1
pkgdesc="Shutdown/reboot/logout utility script"
arch=('any')
url="https://github.com/dglava/obquit"
license=('GPL3')
depends=('python' 'python-gobject' 'python-cairo' 'gtk3')
makedepends=('git' 'python-setuptools' 'python-installer' 'python-build')
source=('git+https://github.com/dglava/obquit.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build
}

package() {
  cd "$srcdir/${pkgname%-git}/dist"
  python -m installer -d $pkgdir *.whl
  install -Dm 644 "${srcdir}/${pkgname%-git}/data/obquit.conf" "${pkgdir}/etc/obquit.conf"
}
