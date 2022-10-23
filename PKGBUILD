# Contributor: Gena genaloner@gmail.com
# Maintainer: Steve trackmastersteve@gmail.com
pkgbase=alienfx
pkgname=alienfx
pkgver=2.4.0
pkgrel=1
pkgdesc="CLI and GUI utility to control the lighting effects of your Alienware computer written in Python."
arch=('any')
url="https://github.com/trackmastersteve/alienfx"
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python' 'python-cairo' 'python-gobject' 'python-pyusb' 'python-future')
source=("https://github.com/trackmastersteve/alienfx/archive/v$pkgver.tar.gz")
sha256sums=('cbe2ce8118a20c84964856daeaf215fa165a7f2d7fa8aa4725b929207c5bba9e')

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py clean
  python setup.py install --root="${pkgdir}"

  install -Dm755 ${pkgbase}/data/etc/udev/rules.d/10-alienfx.rules  ${pkgdir}/etc/udev/rules.d/10-alienfx.rules
  chmod a+x ${pkgdir}/usr/share/applications/alienfx.desktop
}
