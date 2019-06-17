# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.1.0.S.01
pkgrel=1
pkgdesc="GUI for Flatpak applications management"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
source=("${url}/archive/staging.zip")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-staging"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-staging"

  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  
  python3 aur/register_app.py
}
