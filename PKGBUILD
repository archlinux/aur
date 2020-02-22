# Maintainer: Benedikt Rascher-Friesenhausen <benediktrascherfriesenhausen+aur@gmail.com>

pkgname=python-passpy
pkgver=1.0.2
pkgrel=1
pkgdesc="ZX2C4's pass compatible library and cli"
arch=('any')
url="https://github.com/bfrascher/passpy.git"
license=('GPL3')
depends=('python' 'git' 'gnupg' 'python-gitpython' 'python-gnupg'
         'python-click' 'python-pyperclip' 'xclip')
source=("https://github.com/bfrascher/passpy/archive/${pkgver}.tar.gz")
sha512sums=('c3f8bc5a365edb8ee912276baa9b78e91112ee3dfaddb5727f8be176c507ed73f5cb889eebba96c26fa6a8377858a247f47155daa3935cc10eca22b4f0e39d9a')

build() {
  cd "$srcdir/passpy-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/passpy-$pkgver"

  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
