# Maintainer: airwoodix <airwoodix at posteo dot me>
pkgname=zyc
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="A GUI for searching and selecting parts and footprints for use in SKiDL."
arch=(any)
url="https://pypi.org/project/zyc/"
license=('MIT')
depends=('python' 'python-skidl' 'python-kinparse' 'python-wxpython' 'python-pykicad')
makedepends=('python-setuptools')
optdepends=('kicad-library: part libraries')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('092d4b7810c722c208561c840d6417ef')
sha256sums=('57dce3c1f9f58afe349bd53b4f28be50685ff7abbbf04ef11d83ed346cefb3dd')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}


package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
