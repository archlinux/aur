# Contributor: Gena genaloner@gmail.com
pkgbase=alienfx
pkgname=alienfx
pkgver=2.0.5
pkgrel=7
pkgdesc="CLI and GUI utility to control the lighting effects of your Alienware computer written in Python."
arch=('any')
url="https://github.com/trackmastersteve/alienfx"
license=('GPLv3')
makedepends=('python2-setuptools')
depends=('python2' 'python2-cairo' 'python2-gobject' 'python2-pyusb')
source=("git+https://github.com/trackmastersteve/alienfx")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgbase}"
  python2 setup.py clean
  python2 setup.py install --root="${pkgdir}"

  install -Dm755 ${pkgbase}/data/etc/udev/rules.d/10-alienfx.rules  ${pkgdir}/etc/udev/rules.d/10-alienfx.rules
  chmod a+x ${pkgdir}/usr/share/applications/alienfx.desktop
}
