# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.2.1.1
pkgrel=1
pkgdesc="GUI for Flatpak applications management"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/0c201a8ad759aa8b6668c76b42602d1bae257c6f.zip")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/fpakman-0c201a8ad759aa8b6668c76b42602d1bae257c6f"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-0c201a8ad759aa8b6668c76b42602d1bae257c6f"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/register_app.py
}
