# Maintainer : Frikilinux <frikilinux@gmail.com>
# Contributor : peeweep <peeweep at 0x0 dot ee>

pkgname=tidal-dl
pkgver=2021.11.30.1
pkgrel=2
pkgdesc="Download music and videos from Tidal."
arch=('any')
url="https://github.com/yaronzz/Tidal-Media-Downloader"
license=('Apache')
depends=(
  'python-aigpy'
  'python-lyricsgenius'
  'python-pycryptodome'
  'python-pydub'
  'python-prettytable'
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8fd140f1ba05ff8c7c65b5eac0471e2d5ecf497c1c2364fb51891cd6936bcfe5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
