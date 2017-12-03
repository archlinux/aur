# Contributor: Gena genaloner@gmail.com
pkgbase=alienfx
pkgname=alienfx
pkgver=2.1.1
pkgrel=1
pkgdesc="CLI and GUI utility to control the lighting effects of your Alienware computer written in Python."
arch=('any')
url="https://github.com/trackmastersteve/alienfx"
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python' 'python-cairo' 'python-gobject' 'python-pyusb' 'python-future')
source=("https://github.com/trackmastersteve/alienfx/archive/v2.1.1.zip")
sha256sums=('eb307e7132c6830c7e98068af9bf4dfac023e76fa386b8704016e373a77a39d0')

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py clean
  python setup.py install --root="${pkgdir}"

  install -Dm755 ${pkgbase}/data/etc/udev/rules.d/10-alienfx.rules  ${pkgdir}/etc/udev/rules.d/10-alienfx.rules
  chmod a+x ${pkgdir}/usr/share/applications/alienfx.desktop
}
