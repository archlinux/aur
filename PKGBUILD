# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=gespeaker
pkgver=2.0.0
pkgrel=1
pkgdesc="A GTK+ frontend for espeak and mbrola to speech the read text."
url="http://www.muflone.com/gespeaker/"
arch=('any')
license=('GPL')
depends=('espeak' 'python-gobject' 'gtk3' 'python-xdg' 'python-psutil'
         'python-gtts' 'libpulse')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('cc69c3b6ff97dd0257c056517b4795ef5eac30135c98bf55757964a3f87dc021a8ceee621b209db0fd393f3eb6c6b67bdad0f6b5ac66d587b85120f5bbf25bbb')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

