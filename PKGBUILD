# Contributor: Gena genaloner@gmail.com
pkgbase=alienfx
pkgname=alienfx
pkgver=2.1.2
pkgrel=1
pkgdesc="CLI and GUI utility to control the lighting effects of your Alienware computer written in Python."
arch=('any')
url="https://github.com/trackmastersteve/alienfx"
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python' 'python-cairo' 'python-gobject' 'python-pyusb' 'python-future')
source=("https://github.com/trackmastersteve/alienfx/archive/v$pkgver.zip")
sha256sums=('909f0cfd839d52d6d71be7cc0eb4ea88cea0bc254735c684fa955835cbd02a2a')

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py clean
  python setup.py install --root="${pkgdir}"

  install -Dm755 ${pkgbase}/data/etc/udev/rules.d/10-alienfx.rules  ${pkgdir}/etc/udev/rules.d/10-alienfx.rules
  chmod a+x ${pkgdir}/usr/share/applications/alienfx.desktop
}
