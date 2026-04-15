# Maintainer: Charlton Moren <charlton.moren@gmail.com>
pkgname=vxneon-cursor-theme
pkgver=1.0
pkgrel=1
pkgdesc="vxNeon X11/Wayland cursor theme"
arch=('any')
url="https://www.gnome-look.org/p/999909"
license=('custom')
# TODO before pushing to AUR:
#   1. Visit the gnome-look page above, click download, copy the CDN URL.
#   2. Paste it as the `source=()` entry below.
#   3. Run `updpkgsums` to populate sha256sums.
#   4. Verify EXTRACT_DIR matches the top-level directory name inside
#      the archive (inspect with `tar -tf` or `unzip -l`).
source=("vxneon-cursors.tar.gz::https://REPLACE_ME_WITH_REAL_DOWNLOAD_URL")
sha256sums=('SKIP')

EXTRACT_DIR="vxNeon"

package() {
	mkdir -p "$pkgdir/usr/share/icons"
	cp -r "$srcdir/$EXTRACT_DIR" "$pkgdir/usr/share/icons/" 2>/dev/null \
		|| cp -r "$srcdir"/*/ "$pkgdir/usr/share/icons/"
}
