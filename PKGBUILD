# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='python-xapp'
pkgver='1.0.1'
pkgrel='0'
pkgdesc='Python Xapp Library'
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
depends=('python-psutil')
makedepends=('python' 'python-setuptools')
optdepends=("mate-polkit: PolicyKit integration for the MATE desktop"
            "polkit-gnome: PolicyKit integration for the GNOME desktop and derivatives like Cinnamon or Xfce"
            "polkit-kde-agent: PolicyKit integration for the KDE desktop"
            "gksu: Fallback authentication method for the GNOME desktop and derivatives"
            "kdesu: Fallback authentication method for the KDE desktop")
sha256sums=('da2ec46dc3fce97accd0ee6d9bd9d71d26c953b01de1a5336ba2b4b60f2f3b6b')

prepare() {
  cd $pkgname-$pkgver
}         

package() {
  cd $pkgname-$pkgver
  python ./setup.py install --force --root="${pkgdir}" --optimize=1
}
