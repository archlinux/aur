# Maintainer: Dimitri Merejkowsky <d.merej@gmail.com>
pkgname=replacer
pkgver='1.1.1'
pkgrel='1'
pkgdesc='Replace text in files'
arch=('any')
url='https://github.com/dmerejkowsky/replacer'
license=('BSD')
depends=('python')
makedepends=('python' 'python-setuptools')

source=('https://files.pythonhosted.org/packages/7b/25/6419ec652d171552fe8dbc880f42cdf914b54ef8532502b9f398f87ee6de/replacer-1.1.1.tar.gz')
md5sums=('376df23adb228c4327f65e7658b3baa2')


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
