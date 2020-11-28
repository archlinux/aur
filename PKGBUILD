# Contributor: Andrew Rabert <ar@nullsum.net>

pkgbase=mpd-art-box
pkgname='mpd-art-box'
pkgver=0.0.4
_srcname="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="A window displaying the cover for the currently playing MPD track - nothing more"
arch=('any')
url="https://github.com/nvllsvm/mpd-art-box"
license=('MIT')
depends=(
    'python-configargparse' 
    'python-gobject' 
    'python-mpd2'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${_srcname}.tar.gz")
sha256sums=('00a8a49e9b3cc63a8b1b7827b2d8a8b2ed90162ba7f96688c016b4c391ffa27b')

build() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
