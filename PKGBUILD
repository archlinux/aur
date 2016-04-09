# Maintainer: Dimitri Merejkowsky <d.merej@gmail.com>
pkgname=static_tl
pkgver='0.2'
pkgrel='1'
pkgdesc="Generate a static HTML website from your Twitter time line"
arch=('any')
url='https://github.com/dmerejkowsky/static_tl'
license=('BSD')
depends=('python-setuptools'
          'python-arrow'
          'python-jinja'
          'python-twitter')

source=("https://pypi.python.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('8796323ca2d3cee05da7ff7da171683f')


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
