# Maintainer: Dimitri Merejkowsky <d.merej@gmail.com>
pkgname=replacer
pkgver='1.0.4'
pkgrel='1'
pkgdesc='Replace text in files'
arch=('any')
url='https://github.com/dmerejkowsky/replacer'
license=('BSD')
depends=('python')
makedepends=('python' 'python-setuptools')

source=("https://pypi.python.org/packages/source/r/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('2791e8f2f1f607ffab301bc91178a1b0')


build() {
  # build python:
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}

  # python
  python setup.py install --root="$pkgdir/"  --optimize=1

  # license
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 COPYING  "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
