# Contributor: Gena genaloner@gmail.com
pkgbase=alienfx
pkgname=alienfx
pkgver=2.0.5
pkgrel=1
pkgdesc="AlienFX Configuration Utility"
arch=('any')
url="https://github.com/trackmastersteve/alienfx"
license=('GPLv3')
source=("https://github.com/trackmastersteve/${pkgbase}/archive/master.zip")
sha256sums=('2f5342482ba370663cdbebe7237d71f1c177e25ad24d0523315dec83557d2b43')

package_alienfx() {
  makedepends=('python2' 'python2-setuptools')
  depends=('python2' 'python2-cairo' 'python2-gobject' 'python2-pyusb')

  cd "${srcdir}/${pkgbase}-master"
  python2 setup.py clean
  python2 setup.py install --root="${pkgdir}"

  install -Dm755 ${pkgbase}/data/etc/udev/rules.d/10-alienfx.rules  ${pkgdir}/etc/udev/rules.d/10-alienfx.rules
  chmod a+x ${pkgdir}/usr/share/applications/alienfx.desktop
}
