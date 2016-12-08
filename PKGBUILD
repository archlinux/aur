# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgname=mkosi
pkgver=1
pkgrel=2
pkgdesc='Build Legacy-Free OS Images'
arch=('any')
url='https://github.com/systemd/mkosi'
license=('LGPL2.1')
depends=('python')
makedepends=('python-setuptools')
optdepends=('dnf: build Fedora images'
            'debootstrap: build Debian or Ubuntu images'
            'arch-install-scripts: build Arch images'
            'gnupg: sign images'
            'xz: compress images with xz'
            'btrfs-progs: raw_btrfs and subvolume output formats'
            'dosfstools: build bootable images'
            'tar: tar output format'
            'edk2-ovmf: run bootable images in QEMU')
source=("https://github.com/systemd/mkosi/archive/v$pkgver.tar.gz")
sha256sums=('83712a72d59435ace5e6a06392c3c81da78572ba1d33f07adc583cead663a03a')

package() {
  cd "mkosi-$pkgver"
  python setup.py install --root="$pkgdir"
}
