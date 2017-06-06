# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='python-xapp'
pkgver='1.0.0'
pkgrel='3'
pkgdesc='Python Xapp Library'
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
depends=('python-psutil')
makedepends=('python-distutils-extra')
optdepends=("mate-polkit: PolicyKit integration for the MATE desktop"
            "polkit-gnome: PolicyKit integration for the GNOME desktop and derivatives like Cinnamon or Xfce"
            "polkit-kde-agent: PolicyKit integration for the KDE desktop"
            "gksu: Fallback authentication method for the GNOME desktop and derivatives"
            "kdesu: Fallback authentication method for the KDE desktop")
sha256sums=('b23af883b386706329fa955dbf8ef9c939084475be803160510df88437f9a600')

prepare() {
  cd $pkgname-$pkgver
}         

package() {
  cd $pkgname-$pkgver
  python ./setup.py install --force --root="${pkgdir}" --optimize=1
}
