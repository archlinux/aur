# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname="python-desert"
_name="desert"
pkgver=2020.1.6
pkgrel=1
pkgdesc='Implements boolean algebra in one module'
arch=('any')
url='https://github.com/bastikr/boolean.py'
license=('BSD')
depends=('python' 'python-dataclasses' 'python-marshmallow' 'python-attrs' 'python-typing_inspect')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('8975c4358fb23a4f638d353c74578f386c113c6d0d317f6c66122197d4295aecc03c72c814cca68504d87e64f08064b9905f12816972300b962f7558015acc73')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
