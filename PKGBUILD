# Maintainer : Frikilinux <frikilinux@gmail.com>
# Contributor : peeweep <peeweep at 0x0 dot ee>

pkgname=tidal-dl
pkgver=2022.2.7.1
pkgrel=1
pkgdesc="Download videos and tracks from Tidal."
arch=('any')
url="https://github.com/yaronzz/Tidal-Media-Downloader"
license=('Apache')
depends=('python-aigpy' 'python-lyricsgenius' 'python-pycryptodome' 
         'python-pydub' 'python-prettytable' 'python-setuptools' 'python-psutil')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b58c72c4a32b83a9984a08a3fdf5fc92cf1101db2e2691f90042b922f9fd0380')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
