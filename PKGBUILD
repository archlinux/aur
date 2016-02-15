# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=tails-installer
pkgver=4.4.7
pkgrel=1
pkgdesc="Installer for the Tails live operating system"
arch=('x86_64' 'i686')
url="https://tails.boum.org/"
license=(GPL)
depends=('cdrkit' 'coreutils' 'dosfstools' 'e2fsprogs' 'gptfdisk' 'gtk3' 'p7zip' 'python2-configobj' 'syslinux' 'udisks2' 'urlgrabber')
makedepends=('git')
source=("git://git.tails.boum.org/liveusb-creator#tag=tails-installer_${pkgver}")
sha256sums=('SKIP')
_pkgname=liveusb-creator

package() {
  cd "${srcdir}/${_pkgname}"
  sed -i '1!b;s/python/python2/' tails-installer{,-launcher}
  python2 setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
