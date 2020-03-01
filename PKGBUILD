# Maintainer: Jonathon Fernyhough <jonathon_at manjaro+dot_org>
# Upstream maintainer: krumelmonster <krumelmonster@zoho.com>
# Contributor: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

__arch_pkg_commit="dd59624b448ca6f6e48d4f1268fd3c871a20ae76"
_gtkver=3.24.14

pkgbase=gtk3-classic
pkgname=($pkgbase lib32-$pkgbase)
pkgver=${_gtkver}
pkgrel=1
pkgdesc="GTK3 patched for classic desktops like XFCE or MATE. Please see README."
url="https://github.com/krumelmonster/gtk3-mushrooms"
conflicts=(gtk3 gtk3-print-backends)
provides=(gtk3=$_gtkver gtk3-mushrooms=$_gtkver gtk3-print-backends
          libgtk-3.so libgdk-3.so libgailutil-3.so)
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
sha256sums=('4935ec23cbd0150bd479fc457861d3a665354509c3ff933997827c7141c8657c'
            '963d8ac098b4be573897d231acfbb53185bbffae0ecf94861a60271ee664ed0e'
            '3ccdaf68ed3c557987b984d7ad18a3af1e870e8488cd0fb010568281bcbca092'
            '16edf7014239d5ae956d5742167f9facbb6b04588be1c9c4644bb745b7eb7e2b'
            '441e15fdcf3a909628506decdfdaf941e4f812863f2e3e0820e39c61bf93be88'
            '568cd11b34cbfb593bb0aa4c2ae2d2af13e539a5b3d1aca1d370daf791bb9896'
            '3c9c57338bb6ae44a772d189dbaccf1a58f6e64704842ade847ff1bbe11e3ccd'
            '66876362683d2f166842be053c1d324e47df475c1535ff6913ea8245d5a907d9'
            'a1a0d1a7365e7691c4434628e592a853b8593a417962fa01f7ad4792bb1522e8'
            '99d899d53565a74c78f139f57cf726c292b77f2b467ab03ef557ac7e575f86ad'
            '07b3959d1603e5f21f254d01335ff56a5fe5edfec998fd248f12ad925700831d'
            '102479f46d9c40c553824b5f470fc19b9261e7c45ab0333859c04e2e0447c470'
            '384f448b71980f32bd298e491434aa0817f5193c07553f1bbdb937e90c990b61'
            '4386617c929c835c9a94f17a28aa03a4f63f90767cee24c874af77f94efe166d'
            '03e9c02971f9221df1d28421f76263044d1e1a73e00051fea0a8323c7577f247'
            'd868f79b37e8c5d032b5f0fd1ea51a8c50996cb5fa2bf693de082215e9f892db'
            'b4c2dccfb6a1332512c705012be9ffb6bcf07794becda2592c686e9a37054375'
            '009973688864b30287da1768ee56d92bb26974aa097501aef467f0749801ef7a'
            'e6517444d9ec7fb76a2d644a55658dae6f94aba67aba5c230f11afefa9271b51'
            '41080e3632254e50a703dd69f5761784d1545471f8bf3cab1db9eee123957f2f'
            '07faab98d9ff20f7323846840afe860a7fa4a35e67f949e5c26f73fd997d42d5'
            'ba93f62e249f2713dbfe6c82de1be4ac655264d6407ed3dc5e05323027520f31'
            '1c4d69f93ab884fd80c6b95115bfbc12d51ecd029178b6dad3672fdc5ff91e88'
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
