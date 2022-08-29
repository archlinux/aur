# Maintainer : Frikilinux <frikilinux@gmail.com>
# Contributor : peeweep <peeweep at 0x0 dot ee>

pkgname=tidal-dl
pkgver=2022.8.29.1
pkgrel=1
pkgdesc="Download videos and tracks from Tidal."
arch=('any')
url="https://github.com/yaronzz/Tidal-Media-Downloader"
license=('Apache')
depends=('python-aigpy' 'python-lyricsgenius' 'python-pycryptodome'
         'python-pydub' 'python-prettytable' 'python-setuptools' 'python-psutil'
         'python-pyqt5' 'python-qt-material')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0ef873fdfc63ef9cf763d9afd7d82ddf4d147b5518474d669fd1351771e6d77a')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
