# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

pkgname=pyspy
pkgver=0.5.2
pkgrel=1
_distname="PySpy-${pkgver}"
pkgdesc="A simple EVE Online character intel tool"
arch=('any')
url="https://github.com/WhiteRusssian/PySpy"
license=('MIT')
depends=('python' 'python-requests' 'python-wxpython' 'python-pyperclip')
optdepends=()
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz pyspy.desktop pyspy-start.sh)
sha256sums=('4974ef324015a88cfdc17e14ad929fa9081a24f5b135ce710ac6661e160eb9dd'
            '35dd408ec9b397ca3d024b193e2fe4340b87b56a109d099de966bce1331e0744'
            '94b02643d89613e8b491a815fc4f4044d4349ed95a451025cac40dc40f313881')

package() {
  install -dm755 "${pkgdir}"/usr/share/pyspy
  install -dm755 "${pkgdir}"/usr/share/licenses/pyspy

  install -Dm644 "${srcdir}"/"${_distname}"/README.md "${pkgdir}"/usr/share/pyspy
  install -Dm644 "${srcdir}"/"${_distname}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/pyspy
  install -Dm644 "${srcdir}"/"${_distname}"/VERSION "${pkgdir}"/usr/share/pyspy

  cp -a "${srcdir}"/"${_distname}"/*.py "${pkgdir}"/usr/share/pyspy
  cp -a "${srcdir}"/"${_distname}"/assets "${pkgdir}"/usr/share/pyspy
  mv "${pkgdir}"/usr/share/pyspy/__main__.py "${pkgdir}"/usr/share/pyspy/pyspy
  
  install -dm755 "${pkgdir}"/usr/share/pixmaps
  install -Dm644 "${srcdir}"/"${_distname}"/assets/pyspy.png "${pkgdir}"/usr/share/pixmaps/pyspy.png

  install -Dm644 "${srcdir}"/pyspy.desktop "${pkgdir}"/usr/share/applications/pyspy.desktop
  install -Dm755 "${srcdir}"/pyspy-start.sh "${pkgdir}"/usr/bin/pyspy
}

