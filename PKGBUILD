# Maintainer: Charlton Moren <charlton.moren@gmail.com>
pkgname=vxneon-cursor-theme
pkgver=0.24
pkgrel=1
pkgdesc="JY xNeon — neon X11/Wayland cursor theme (alpha)"
arch=('any')
url="https://www.gnome-look.org/p/999909"
license=('custom')
source=("$pkgname-$pkgver.tar.gz::https://github.com/veasman/kara-cursor-mirror/releases/download/v1/157292-vxNeon024.tar.gz")
sha256sums=('ccdf8f3643a438f86d367afb845d1dc6e65f33338ffeb9a611cf3aca088354a6')

package() {
	install -dm755 "$pkgdir/usr/share/icons"
	# Archive top-level dir is "JYxNeon/" (upstream's internal name) and
	# index.theme reports "JY xNeon". Keep the directory name so users can
	# reference `JYxNeon` via XCURSOR_THEME or gtk-cursor-theme-name.
	cp -r "$srcdir/JYxNeon" "$pkgdir/usr/share/icons/JYxNeon"
	chmod -R u=rwX,go=rX "$pkgdir/usr/share/icons/JYxNeon"
}
