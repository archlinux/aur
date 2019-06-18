# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.2.0.3
pkgrel=1
pkgdesc="GUI for Flatpak applications management"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/4e81563faf861a37b8ca6f00fafe6131f77c9560.zip")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-4e81563faf861a37b8ca6f00fafe6131f77c9560"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-4e81563faf861a37b8ca6f00fafe6131f77c9560"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/register_app.py
}
