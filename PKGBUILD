# Maintainer: codingTornado <milopezv at gmail dot com>

pkgname=python-imagemounter
pkgver=3.1.0
pkgrel=2
pkgdesc="CLI utility and Python package for (un)mounting forensic disk images."
arch=(any)
url="https://github.com/ralphje/imagemounter"
license=(MIT)
depends=('python' 'python-termcolor')
optdepends=('afflib: mounting AFF disk images'
		'avfs: mounting avfs disk images'
		'cryptsetup: mounting encripted volumes'
		'disktype: detecting content format of disk images'
		'file'
		'libbde: mounting BDE volumes'
		'libvshadow-git: mounting Volume Shadow Snapshot volumes'
		'lvm2: mounting LVM volumes'
		'mdadm: mounting Software RAID volumes'
		'mtd-utils: mounting JFFS2 volumes'
		'ntfs-3g: mounting NTFS volumes'
		'parted: detecting volumes and its types'
		'python-magic: filetype detection'
		'qemu: mounting Qcow2 disk images'
		'sleuthkit: covers various tasks'
		'squashfs-tools: mounting SquashFS volumes'
		'testdisk: carving images for deleted files'
		'util-linux: locating/printing block device attributes'
		'vmfs-tools: mounting VMFS volumes'
		'vmware-workstation: mounting VMWare disk images'
		'xfsprogs: mounting XFS volumes'
		'xmount: mounting several types of disk images')
source=('https://files.pythonhosted.org/packages/c5/cb/79fbf7130aa46315d3525f8780ee7961474bfd25ff965cc4285b64f37c7a/imagemounter-3.1.0.tar.gz')
sha256sums=(d2305fdf6424c0976132546e42c039182e74670b0e404ff40368a42861c3e213)

build() {
  cd "$srcdir"/imagemounter-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/imagemounter-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
