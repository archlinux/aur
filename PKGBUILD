# Contributor: Gena genaloner@gmail.com
pkgbase=alienfx
pkgname=alienfx
pkgver=2.0.5
pkgrel=4
pkgdesc="AlienFX Configuration Utility"
arch=('any')
url="https://github.com/trackmastersteve/alienfx"
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python' 'python-cairo' 'python-gobject' 'python-pyusb')
source=("https://github.com/trackmastersteve/${pkgbase}/archive/master.zip")
sha256sums=('3b67a8aaea8580c8ec8bfc37970e305a9a258096f66587ed8acab7d204878323')

package_alienfx() {  
  cd "${srcdir}/${pkgbase}-master"
  python setup.py clean
  python setup.py install --root="${pkgdir}"

  install -Dm755 ${pkgbase}/data/etc/udev/rules.d/10-alienfx.rules  ${pkgdir}/etc/udev/rules.d/10-alienfx.rules
  chmod a+x ${pkgdir}/usr/share/applications/alienfx.desktop
}
