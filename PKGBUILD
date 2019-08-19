# Maintainer: Danilo Bargen aur ât dbrgn döt ch
# PGP key is on keyservers and at https://keybase.io/dbrgn
pkgname=upscrot
pkgver=1.0.1
pkgrel=1
pkgdesc="Take a screenshot using the Linux scrot command and upload it to your SSH server."
arch=('any')
url="https://github.com/dbrgn/$pkgname"
license=('GPL')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-appdirs' 'scrot')
source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz.asc"
)
sha256sums=(
  '03f1a6d5f9cb81c1818efda11f3ac18d710285428eb107f2267aab68e5b60866'
  'SKIP'
)
validpgpkeys=('EA456E8BAF0109429583EED83578F667F2F3A5FA')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
