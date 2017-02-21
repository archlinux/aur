# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgname=mkosi-git
pkgver=r177.69536ba
pkgrel=1
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
            'squashfs-tools: raw_squashfs output format'
            'tar: tar output format'
            'cryptsetup: add dm-verity partitions'
            'edk2-ovmf: run bootable images in QEMU'
            'sbsigntools: sign EFI binaries for UEFI SecureBoot')
provides=('mkosi')
conflicts=('mkosi')
source=("git://github.com/systemd/mkosi.git")
md5sums=('SKIP')

pkgver() {
  cd "mkosi"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "mkosi"

  python setup.py install --root="$pkgdir"
}

