pkgname=tidal-gui
pkgver=2022.1.18.3
pkgrel=1
pkgdesc="GUI to download videos and tracks from Tidal."
arch=('any')
url="https://github.com/yaronzz/Tidal-Media-Downloader"
license=('Apache')
depends=('python-aigpy' 'python-pycryptodome' 'python-pydub' 'python-prettytable'
         'python-pyqt5' 'python-setuptools' 'tidal-dl')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ae18580ec43d61b7e317023e8ae700ec3a2692b8eeffb09aac6fcf036d163603')

build() {
  cd "${pkgname}-${pkgver}"
  python setup-gui.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup-gui.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
