# Maintainer: Jose Lopes <josemslopes at gmail dot com>

pkgname=python3-application
pkgver=3.0.3
pkgrel=1
pkgdesc="Basic building blocks for Python applications"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-application"
depends=('python' 'python-zope-interface')
source=("https://github.com/AGProjects/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('5fd9bd0df4312a912534e38ed8a20116134efa4008641399cffc0d16d581bcdb799135290c88f11572903e8b76702f312dc01776814edbede3b38aa8f8006cc0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # license
  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
