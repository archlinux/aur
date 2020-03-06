# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=python-huepy

pkgver=1.2.1
pkgrel=1

pkgdesc='Python module to help with printing awesomely in terminals'
arch=('any')
url="https://github.com/s0md3v/${pkgname#python-}"
license=('GPL3')

makedepends=('python-setuptools')
depends=('python')

source=("https://files.pythonhosted.org/packages/d6/4e/2dae447d8858a31158ca6c313f5d1902bc83b8542bb5f10c0307de2973bc/${pkgname#python-}-$pkgver.tar.gz")
sha256sums=('5b29beef797312fb7606188bc5cd98f78ab8f7e01576427a9312f1c9b20b759d')


build() {
  cd "${pkgname#python-}-$pkgver"
  python setup.py build
}

package() {
  cd "${pkgname#python-}-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1 --skip-build
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/${pkgname#-python}/"
  # remove stray license file
  rm -f "$pkgdir/usr/LICENSE"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
