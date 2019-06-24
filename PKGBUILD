# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.2.1.2
pkgrel=1
pkgdesc="GUI for Flatpak applications management"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/d9d6e037b6bd50d354f2457973984411aa8c2282.zip")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/fpakman-d9d6e037b6bd50d354f2457973984411aa8c2282"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-d9d6e037b6bd50d354f2457973984411aa8c2282"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/register_app.py
}
