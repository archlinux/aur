# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=virt-backup
pkgver=0.1.1
pkgrel=1
pkgdesc="Automatic backups for Libvirt"
arch=(any)
url="https://github.com/Anthony25/virt-backup"
license=(BSD)
makedepends=(
  python-setuptools
)
depends=(
  libvirt-python3
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
sha256sums=('bf2555004d7c509ddd73a85d1b324588ab8128dcc23b5b3f9c74ad2814d3a405')

package() {
  cd "${srcdir}/virt-backup-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

	install -D -m644 example/virt-backup-clean.service "$pkgdir/usr/lib/systemd/system/virt-backup-clean.service"
}

# vim:set ts=2 sw=2 et:
