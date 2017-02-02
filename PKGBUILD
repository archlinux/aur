# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=mnemosyne
pkgver=2.4.1
pkgrel=3
pkgdesc="A flash-card tool with a sophisticated card review algorithm"
arch=('i686' 'x86_64')
url='http://www.mnemosyne-proj.org'
license=('GPL')
depends=('python-pyqt5' 'qt5-webengine'
         'python-pillow' 'python-matplotlib' 'python-cherrypy' 'python-webob')
makedepends=('python-setuptools')
optdepends=('texlive-core: support for mathematical formulae in cards'
            'ttf-ms-fonts: support for non-latin labels on statistic plots')
conflicts=('mnemosyne-bzr')
install='mnemosyne.install'

source=("http://downloads.sourceforge.net/mnemosyne-proj/Mnemosyne-${pkgver}.tar.gz")
md5sums=('6282a92604e4082b75312e72fc1ae297')

build() {
  cd "Mnemosyne-${pkgver}/"
  python setup.py build
}

package() {
  cd "Mnemosyne-${pkgver}/"
  python setup.py install --root="${pkgdir}"
}
