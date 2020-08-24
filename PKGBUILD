# Contributor: Andrew Rabert <ar@nullsum.net>

pkgbase=mpd-art-box
pkgname='mpd-art-box'
pkgver=0.0.3
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
sha256sums=('d77619ac62b01d4171ae616653e7ec54a57b726a5075ffcf707def5c4ef65f5c')

build() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
