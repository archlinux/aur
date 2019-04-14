# Maintainer: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=mnemosyne
pkgver=2.6.1
pkgrel=2
pkgdesc="A flash-card tool with a sophisticated card review algorithm"
arch=('i686' 'x86_64')
url='http://www.mnemosyne-proj.org'
license=('GPL')
depends=('python-pyqt5' 'qt5-webengine'
         'python-pillow' 'python-matplotlib' 'python-cherrypy' 'python-webob'
         'python-pyqtwebengine')
makedepends=('python-setuptools')
optdepends=('texlive-core: support for mathematical formulae in cards'
            'ttf-ms-fonts: support for non-latin labels on statistic plots'
            'python-cheroot: support for starting a sync server'
            'python-opengl: mentioned in a non-fatal warning')
conflicts=('mnemosyne-bzr')
install='mnemosyne.install'

source=("http://downloads.sourceforge.net/mnemosyne-proj/Mnemosyne-${pkgver}.tar.gz")
sha256sums=('6331241bc7caf26fed2e4d32c3c18da33116389b67af621da679a950f08c9c75')

build() {
  cd "Mnemosyne-${pkgver}/"
  
  python setup.py build
}

package() {
  cd "Mnemosyne-${pkgver}/"
  python setup.py install --root="${pkgdir}" --optimize=1
}

