# Maintainer: Jonathon Fernyhough <jonathon_at manjaro+dot_org>
# Upstream maintainer: krumelmonster <krumelmonster@zoho.com>
# Contributor: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

__arch_pkg_commit="811bc6d9df014e576e95e45af9ac43e4108fb55a"
_gtkver=3.24.12

pkgbase=gtk3-classic
pkgname=($pkgbase lib32-$pkgbase)
pkgver=${_gtkver}+81
pkgrel=1
pkgdesc="GTK3 patched for classic desktops like XFCE or MATE. Please see README."
url="https://github.com/krumelmonster/gtk3-mushrooms"
conflicts=(gtk3 gtk3-print-backends)
provides=(gtk3=$_gtkver gtk3-mushrooms=$_gtkver gtk3-print-backends)
arch=(x86_64)
license=(LGPL)
makedepends=(
	gobject-introspection libcanberra gtk-doc sassc libcups meson quilt

	atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 fribidi
	libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
	json-glib librsvg wayland-protocols desktop-file-utils mesa gtk-update-icon-cache
	adwaita-icon-theme cantarell-fonts

	lib32-atk lib32-cairo lib32-libxcursor lib32-libxinerama lib32-libxrandr lib32-libxi
	lib32-libepoxy lib32-gdk-pixbuf2 lib32-fribidi lib32-libxcomposite lib32-libxdamage 
	lib32-pango lib32-at-spi2-atk lib32-wayland lib32-libxkbcommon lib32-json-glib
	lib32-librsvg lib32-mesa lib32-libcups lib32-krb5 lib32-e2fsprogs
)
install=gtk3.install
source=(
	# Patch files.
	series
	plus81.patch.xz
	appearance__buttons-menus-icons.patch
	appearance__disable-backdrop.patch
	appearance__file-chooser.patch
	appearance__message-dialogs.patch
	appearance__print-dialog.patch
	appearance__smaller-statusbar.patch
	csd__clean-headerbar.patch
	csd__disabled-by-default.patch
	csd__server-side-shadow.patch
	file-chooser__places-sidebar.patch
	file-chooser__typeahead.patch
	fixes__atk-bridge-errors.patch
	fixes__labels-wrapping.patch
	fixes__too-large-menu-covers-bar.disabled-patch
	other__default-settings.patch
	other__hide-insert-emoji.patch
	other__mnemonics-delay.patch
	popovers__color-chooser.patch
	popovers__file-chooser-list.patch
	popovers__places-sidebar.patch

	# Theme CSS stylesheet.
	smaller-adwaita.css

	# GTK source code.
	"https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-$_gtkver.tar.xz"

	# Arch Linux package files.
	"settings.ini::https://git.archlinux.org/svntogit/packages.git/plain/trunk/settings.ini?h=packages/gtk3&id=$__arch_pkg_commit"
	"gtk-query-immodules-3.0.hook::https://git.archlinux.org/svntogit/packages.git/plain/trunk/gtk-query-immodules-3.0.hook?h=packages/gtk3&id=$__arch_pkg_commit"

	README.md
)
sha256sums=('9a48bcbde6ecf1dace9c50ba926850f228858e5634d9235325b1534b8ce4d007'
            '3eac62f5f38fd36ccedf33e3618737d427b294b525a51feaef0faa7227ebaec9'
            '728075255a559f0ec2cbde78c0fdcb9bdaa6859f21cdd8e0070595233822029e'
            '795f745545a7d0c899c27d0832e15a1376f6e34fa1ef9c2ceada5f7f575cbb79'
            '8ead5c4a6fbad9b1fbf81bf67ed2e1b8a8ce8d25d459c0fff9372937963b4f95'
            '78f4086512d3bac999b62651b952412aa5270d7822c88e9c14900f53a93b42f4'
            '768e6b45dd1c21f035c714d49e4d41ac082833054ac83060b601dbdae6a890dc'
            'b1922fc4e99691ebaa4c0becc1f6fd6bcfe286f4451c946c4bec51c352b04e61'
            '4803ff9b5a279516db5c099b1ffb18860906ce5bbcace16a8021e8cce7859c81'
            '554772d3f8bf7232d1bbbf724d83a0e1e21c2e404721e6c9dfd4a4e4c3372a42'
            '14e98ac6b7a54653ee550a855b928f6f47645710ca5ebc7593d27953a28b115a'
            'fcf825d83ef4ff58440e6f0f6ba0fcd75069777ca8c82c7f6c427dc911e44374'
            '150fa6b5e95a65ff22f80b58dadc683b6e69abe6dad4f1d8389451329df35a1e'
            '85854e99c0c52ebccc7ee9a8e70cbbe04ea892c85290195a11a551bb1a096b2f'
            '2b1d2f8791ca9b0e46f8a33e8ef5e266995f9914fd43792471a34073565650bc'
            '701b57eb831345fa89ce88105d1b43d61de144bfc613f33dbb027c526a101985'
            '98b0815e5f5610adaa0c192e2860efb77678d37ae095a88869c17397f8ce9b60'
            '2a6541d70fe85fc0044e754423c6813c307a80ec5aa5a58df77acb8181f1ff81'
            'e930370d96697981cbf13af18f36f2146c3e2279ae3d59b8a5837410c99c8ef8'
            '73e832b83e51aed6f662d7b7ee60ae471b3d28796250cbd40ec3a32c49b89831'
            'ddd05293726f3c87db96662c1ffa2ac5a33e00f7dc198be4cd483ed559e94be8'
            '22a092521ea7e156d4532e6c6aaddba5fe51b6ca91345665e7369cef56ac2e1c'
            'ba93f62e249f2713dbfe6c82de1be4ac655264d6407ed3dc5e05323027520f31'
            '1384eba5614fed160044ae0d32369e3df7b4f517b03f4b1f24d383e528f4be83'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845'
            '1d2e3c41c7de03a31d717b09e053c88cbaca2ae74eefd982549c49de81c21ada')

prepare()
{
	QUILT_PATCHES=. quilt push -av

	rm -f "$srcdir"/gtk+-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css
	cat "$srcdir/smaller-adwaita.css" | tee -a "$srcdir"/gtk+-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css > /dev/null
}

build()
{
	CFLAGS+=" -DG_ENABLE_DEBUG -DG_DISABLE_CAST_CHECKS"

	# 64-bit
	arch-meson gtk+-$_gtkver build \
		-D broadway_backend=true \
		-D colord=no \
		-D demos=true \
		-D examples=false \
		-D tests=false \
		-D installed_tests=false
	ninja -C build

	# 32-bit
	export PKG_CONFIG_LIBDIR="/usr/lib32/pkgconfig"
	export PKG_CONFIG_PATH="/usr/share/pkgconfig"

	CFLAGS+=" -m32"
	CXXFLAGS+=" -m32"
	LDFLAGS+=" -m32"

	linux32 arch-meson gtk+-$_gtkver build32 \
		-D broadway_backend=true \
		-D colord=no \
		-D demos=false \
		-D examples=false \
		-D tests=false \
		-D installed_tests=false \
		-D libdir=/usr/lib32
	linux32 ninja -C build32
}

package_gtk3-classic()
{
	depends=(
		atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 fribidi
		libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
		json-glib librsvg wayland-protocols desktop-file-utils mesa gtk-update-icon-cache
	)
	optdepends=(
		'libcups: printers in printing dialog'
		'dconf: default GSettings backend'
		'libcanberra: sounds events'
		'adwaita-icon-theme: default icon theme'
		'cantarell-fonts: default font'
	)

	DESTDIR="$pkgdir" meson install -C build

	install -Dt "$pkgdir/usr/share/gtk-3.0" -m644 settings.ini
	install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

	rm "$pkgdir/usr/bin/gtk-update-icon-cache"

	install -Dm644 "$srcdir"/README.md "$pkgdir/usr/share/gtk-3.0/README.md"
	sed -i 's/mushrooms/classic/g' "$pkgdir/usr/share/gtk-3.0/README.md"
}

package_lib32-gtk3-classic()
{
	pkgdesc="GTK3 patched for classic desktops like XFCE or MATE. (32-bit)"
	depends=(
		lib32-atk lib32-cairo lib32-libxcursor lib32-libxinerama lib32-libxrandr lib32-libxi
		lib32-libepoxy lib32-gdk-pixbuf2 lib32-fribidi lib32-libxcomposite lib32-libxdamage 
		lib32-pango lib32-at-spi2-atk lib32-wayland lib32-libxkbcommon lib32-json-glib
		lib32-librsvg lib32-mesa lib32-libcups lib32-krb5 lib32-e2fsprogs
		"gtk3-classic>=$pkgver"
	)
	conflicts=("lib32-gtk3")
	provides=("lib32-gtk3=$pkgver")

	DESTDIR="$pkgdir" linux32 meson install -C build32

	rm -fr "$pkgdir"/etc
	rm -fr "$pkgdir"/usr/{bin,share,include}
}
