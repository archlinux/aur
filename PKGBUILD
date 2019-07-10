# Maintainer: aimileus <me at aimileus dot nl>
# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=tails-installer
pkgver=5.0.15
pkgrel=1
pkgdesc="Installer for the Tails live operating system"
arch=('any')
url="https://tails.boum.org/"
license=(GPL)
depends=('cdrkit' 'coreutils' 'dosfstools' 'e2fsprogs' 'gptfdisk' 'gtk3' 'mtools' 'p7zip' 'parted' 'python2-configobj' 'python2-distutils-extra' 'python2-gobject' 'syslinux' 'udisks2' 'urlgrabber')
makedepends=('git')
source=("git://git.tails.boum.org/liveusb-creator#tag=tails-installer_${pkgver}")
sha256sums=('SKIP')
_pkgname=liveusb-creator

build() {
  cd liveusb-creator
  python2 setup.py build
}

package() {
  cd liveusb-creator

  python2 setup.py install --root="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
