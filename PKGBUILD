# Maintainer : Frikilinux <frikilinux@gmail.com>
# Contributor : peeweep <peeweep at 0x0 dot ee>

pkgname=tidal-dl
pkgver=2022.1.11.1
pkgrel=2
pkgdesc="Download videos and tracks from Tidal."
arch=('any')
url="https://github.com/yaronzz/Tidal-Media-Downloader"
license=('Apache')
depends=('python-aigpy' 'python-lyricsgenius' 'python-pycryptodome' 
         'python-pydub' 'python-prettytable' 'python-setuptools' 'python-psutil')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4c1bd416fa8a233b7f3982d47ad4e94b56b94a9d340148855baa60501b87b44f')

prepare() {
  rm -rf "${pkgname}-${pkgver}/tidal_gui"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
