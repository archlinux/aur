# Maintainer: Charlton Moren <charlton.moren@gmail.com>
pkgname=skyrim-cursor-theme
pkgver=1.0
pkgrel=1
pkgdesc="Skyrim-inspired X11/Wayland cursor theme"
arch=('any')
url="https://www.gnome-look.org/p/1369496"
license=('custom')
# TODO before pushing to AUR:
#   1. Visit the gnome-look page above and click the download button.
#   2. Copy the direct CDN URL for the archive (files.gnome-look.org / opendesktop CDN).
#   3. Paste it below as the `source=()` entry.
#   4. Run `updpkgsums` to fill in sha256sums.
#   5. Verify the archive extracts into a directory whose name matches
#      the SKYRIM_DIR variable in package() below (check with `tar -tf`).
source=("skyrim-cursors.tar.gz::https://REPLACE_ME_WITH_REAL_DOWNLOAD_URL")
sha256sums=('SKIP')

# Theme directory name inside the extracted archive. Adjust after
# inspecting the tarball contents.
SKYRIM_DIR="Skyrim"

package() {
	mkdir -p "$pkgdir/usr/share/icons"
	# Common layouts: a single top-level directory OR multiple variant
	# directories. Copy everything and let pacman own the install paths.
	cp -r "$srcdir/$SKYRIM_DIR" "$pkgdir/usr/share/icons/" 2>/dev/null \
		|| cp -r "$srcdir"/*/ "$pkgdir/usr/share/icons/"
}
