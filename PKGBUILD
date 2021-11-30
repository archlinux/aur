# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_project=QJackCapture
pkgname="${_project,,}"
pkgver=0.1.1
pkgrel=2
pkgdesc="A GUI for easy recording of JACK audio sources using jack_capture"
arch=('any')
url="https://github.com/SpotlightKid/qjackcapture"
license=('GPL')
depends=('hicolor-icon-theme' 'jack_capture' 'python-pyjacklib' 'python-pyqt5')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/q/${pkgname}/${_project}-${pkgver}.tar.gz")
sha256sums=('5094c22899f7b5c0d6e745f866f4b4e952a8b4363a6ccd857a7bc4c8c5b4bca4')


build() {
  cd "${srcdir}/${_project}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${_project}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
  # documentation
  #install -Dm644 README.md *.png -t "${pkgdir}/usr/share/doc/$pkgname"
}
