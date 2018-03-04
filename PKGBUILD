# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=virt-backup
pkgver=0.2.0
pkgrel=1
pkgdesc="Automatic backups for Libvirt"
arch=(any)
url="https://github.com/Anthony25/virt-backup"
license=(BSD)
makedepends=(
  python-setuptools
)
depends=(
  libvirt-python
  python-appdirs
  python-argparse
  python-arrow
  python-defusedxml
  python-lxml
  python-tqdm
  python-yaml
)
options=(!emptydirs)
source=("https://github.com/Anthony25/virt-backup/archive/${pkgver}.tar.gz")
sha256sums=('ad9f7666af00e62ced722443d0b010b4b19b190ecbf24f053b5e7f0ece45e09c')

package() {
  cd "${srcdir}/virt-backup-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

	install -D -m644 example/virt-backup-clean.service "$pkgdir/usr/lib/systemd/system/virt-backup-clean.service"
}

# vim:set ts=2 sw=2 et:
