# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=virt-backup
pkgver=0.1.1
pkgrel=2
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
sha256sums=('cc2b95c60fefabafa1b178b81bcfd29c295767785dc1febb713ae67130ff53a5')

package() {
  cd "${srcdir}/virt-backup-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

	install -D -m644 example/virt-backup-clean.service "$pkgdir/usr/lib/systemd/system/virt-backup-clean.service"
}

# vim:set ts=2 sw=2 et:
