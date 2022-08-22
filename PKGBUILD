# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=cpucompare
pkgver=0.8.1
pkgrel=1
pkgdesc="A GTK+ application to make comparisons between CPU models."
url="https://www.muflone.com/cpucompare"
arch=('any')
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-xdg' 'gobject-introspection')
provides=('cpucompare')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0eef9a8ae431d34be5d138b0a036dcf94f097f2348a2bdd8808d5f9f585d574e')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

