# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgname=mkosi
pkgver=3
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
            'zypper-git: build openSUSE images'
            'gnupg: sign images'
            'xz: compress images with xz'
            'btrfs-progs: raw_btrfs and subvolume output formats'
            'dosfstools: build bootable images'
            'squashfs-tools: raw_squashfs output format'
            'tar: tar output format'
            'cryptsetup: add dm-verity partitions'
            'edk2-ovmf: run bootable images in QEMU'
            'sbsigntools: sign EFI binaries for UEFI SecureBoot')
source=("https://github.com/systemd/mkosi/archive/v$pkgver.tar.gz")
sha256sums=('3bb606f16a26e08ce071e673cb935e62cecb3559db6b41c620f240666d7c5734')

package() {
  cd "mkosi-$pkgver"
  python setup.py install --root="$pkgdir"
}
