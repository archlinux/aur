# Maintainer: François-Xavier Payet <fx.payet@tfdn.org>
pkgname=snapraid-btrfs-git
pkgver=v0.14.0.r2.4f51a6d
pkgrel=1
pkgdesc="snapraid-btrfs is a script for using SnapRAID with data drives which are formatted with btrfs."
arch=('any')
url="https://github.com/automorphism88/snapraid-btrfs.git"
license=('GPL3')
depends=('bash')
optdepends=('snapraid: tool for Snapshot RAID')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
source=('git+https://github.com/automorphism88/snapraid-btrfs')
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "$srcdir/${pkgname%-git}/snapraid-btrfs" "$pkgdir/usr/bin/snapraid-btrfs"
}
