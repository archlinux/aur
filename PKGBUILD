# Contributor: Gena genaloner@gmail.com
pkgbase=alienfx
pkgname=alienfx
pkgver=2.2.0
pkgrel=1
pkgdesc="CLI and GUI utility to control the lighting effects of your Alienware computer written in Python."
arch=('any')
url="https://github.com/trackmastersteve/alienfx"
license=('GPLv3')
makedepends=('python-setuptools')
depends=('python' 'python-cairo' 'python-gobject' 'python-pyusb' 'python-future')
source=("https://github.com/trackmastersteve/alienfx/archive/v$pkgver.tar.gz")
sha256sums=('49ec2496f3d5146c11c9543122ec52c5b2369ef59a32be761d04352f16a72f45')

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py clean
  python setup.py install --root="${pkgdir}"

  install -Dm755 ${pkgbase}/data/etc/udev/rules.d/10-alienfx.rules  ${pkgdir}/etc/udev/rules.d/10-alienfx.rules
  chmod a+x ${pkgdir}/usr/share/applications/alienfx.desktop
}
