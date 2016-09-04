# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Aelius (find me on Freenode)

pkgname=gdevilspie
pkgver=0.5
pkgrel=4
pkgdesc="An user friendly interface to devilspie window matching daemon"
arch=('any')
url="http://code.google.com/p/gdevilspie"
license=('GPL')
depends=('pygtk' 'devilspie' 'python2-wnck' 'python2' 'python2-xdg')
makedepends=()
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "xdg_basedirectory.patch")
sha256sums=('e03ab813e56b6dc6d868db7c318d280c9864cfa6e8a4ca84a5bb5d05542f55ff'
            'b8d287159b14a779c4fed525d010ad4a907eacd392e9409a2c199a4350342c89')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/xdg_basedirectory.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}
