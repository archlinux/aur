# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='python-xapp'
pkgver='1.0.0'
pkgrel='4'
_snapshot=212eb0bcd73ebaa3666d54d6e61179371bdf544b #this enable support for pkexec in the right way
pkgdesc='Python Xapp Library'
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=('GPL3')
#source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$_snapshot.tar.gz")
depends=('python-psutil')
makedepends=('python-distutils-extra')
optdepends=("mate-polkit: PolicyKit integration for the MATE desktop"
            "polkit-gnome: PolicyKit integration for the GNOME desktop and derivatives like Cinnamon or Xfce"
            "polkit-kde-agent: PolicyKit integration for the KDE desktop"
            "gksu: Fallback authentication method for the GNOME desktop and derivatives"
            "kdesu: Fallback authentication method for the KDE desktop")
sha256sums=('6f02c458eddd7bdc1918bb4b9106d5679c9fc8d74a12be9aa331979831748250')      

package() {
  #cd $pkgname-$pkgver
  cd $pkgname-$_snapshot
  python ./setup.py install --force --root="${pkgdir}" --optimize=1
}
