# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gptrace
pkgver=0.5.0
pkgrel=1
pkgdesc="Trace the activities of an external application"
url="https://www.muflone.com/gptrace/"
arch=('any')
license=('GPL')
depends=('gtk3' 'gobject-introspection' 'python-xdg' 'python-gobject' 'python-ptrace')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0c0f6c6098f8d49324b81bf3b5393ccadfe935e698b30c70b8b8985f97a1b942')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

