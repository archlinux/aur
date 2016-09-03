# Maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-multipledispatch'
pkgname=('python-multipledispatch')
pkgver=0.4.8
pkgrel=1
pkgdesc='Multiple dispatch implementation in Python'
arch=('any')
url='https://github.com/mrocklin/multipledispatch'
license=('BSD')
makedepends=('python-setuptools')
depends=('python>=3.4')
source=("https://github.com/mrocklin/multipledispatch/archive/$pkgver.tar.gz")
sha1sums=('75f71b3361c5efd5b0855ec6a1cba5fc0cd51726')
md5sums=('e46a251440ad31b6df6819e1e78bd2f2')

build() {
  cd "${srcdir}"/multipledispatch-$pkgver
  python setup.py build
}

package_python-multipledispatch() {
  cd "${srcdir}"/multipledispatch-$pkgver
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
