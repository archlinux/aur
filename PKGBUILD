# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='python-xapp'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Python Xapp Library'
arch=(any)
url="http://packages.linuxmint.com/pool/main/p/${pkgname}"
license=('GPL3')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
depends=('python-psutil')
makedepends=('python-distutils-extra')
optdepends=("mate-polkit: PolicyKit integration for the MATE desktop"
            "polkit-gnome: PolicyKit integration for the GNOME desktop and derivatives like Cinnamon or Xfce"
            "polkit-kde-agent: PolicyKit integration for the KDE desktop")
sha256sums=('3caee253dc636972522e152f1be905c6fe91369cca9bde3eb42a856a64af54ab')

prepare() {
  cd ${pkgname}
}         

package() {
  cd ${pkgname}
  python ./setup.py install --force --root="${pkgdir}" --optimize=1
}