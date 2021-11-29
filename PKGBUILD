# Maintainer: François-Xavier Payet <fx.payet@tfdn.org>
pkgname=snapraid-btrfs-git
pkgver=0.14.1
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

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags | cut -c 2- | cut -d - -f 1)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "$srcdir/${pkgname%-git}/snapraid-btrfs" "$pkgdir/usr/bin/snapraid-btrfs"
}
