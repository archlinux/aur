# Maintainer: Benedikt Rascher-Friesenhausen <benediktrascherfriesenhausen+aur@gmail.com>

pkgname=python-passpy
pkgver=1.0rc2
pkgrel=1
pkgdesc="ZX2C4's pass compatible library and cli"
arch=('any')
url="https://github.com/bfrascher/passpy.git"
license=('GPL3')
depends=('python' 'git' 'gnupg' 'python-gitpython' 'python-gnupg'
         'python-click' 'python-pyperclip' 'xclip')
source=("https://github.com/bfrascher/passpy/archive/v${pkgver}.tar.gz")
md5sums=('256d983de42c38259b0e65e586feb6fe')

build() {
  cd "$srcdir/passpy-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/passpy-$pkgver"

  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
