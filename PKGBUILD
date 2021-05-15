# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=gespeaker
pkgver=2.0.1
pkgrel=1
pkgdesc="A GTK+ frontend for espeak and mbrola to speech the read text."
url="http://www.muflone.com/gespeaker/"
arch=('any')
license=('GPL')
depends=('espeak' 'python-gobject' 'gtk3' 'python-xdg' 'python-psutil'
         'python-gtts' 'libpulse')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('616d97561978a728b8a8f9acc6c1d026541587357f5516c6af16cba573a38f3855fde6f4d629910cf89f2ca5b251e14df62bfc0d9101c1aa8f9730c83940ea2c')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

