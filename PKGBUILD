# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gptrace
pkgver=0.6.0
pkgrel=1
pkgdesc="Trace the activities of an external application"
url="https://www.muflone.com/gptrace/"
arch=('any')
license=('GPL')
depends=('gtk3' 'gobject-introspection' 'python-xdg' 'python-gobject' 'python-ptrace')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('480c38c7b60d298827a29c01e8d74c640ff86ecffb0df2de5d88a2f7518de14a')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}
