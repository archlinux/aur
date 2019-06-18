# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.2.0.5
pkgrel=1
pkgdesc="GUI for Flatpak applications management"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/4c55e7a61726aa59a4ac005d6c72381d15d0444e.zip")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/fpakman-4c55e7a61726aa59a4ac005d6c72381d15d0444e"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-4c55e7a61726aa59a4ac005d6c72381d15d0444e"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/register_app.py
}
