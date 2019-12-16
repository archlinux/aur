# Maintainer: Jonathon Fernyhough <jonathon_at manjaro+dot_org>
# Upstream maintainer: krumelmonster <krumelmonster@zoho.com>
# Contributor: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

__arch_pkg_commit="dd59624b448ca6f6e48d4f1268fd3c871a20ae76"
_gtkver=3.24.13

pkgbase=gtk3-classic
pkgname=($pkgbase lib32-$pkgbase)
pkgver=${_gtkver}+23
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
	plus23.patch.xz
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
sha256sums=('01d9f898c75bbe8864651e5058289e8d61626bd5fe231f382cfbcad74af69fa1'
            '3f09e78c05868d9af21f5ede03a25d99aaba30adb469ea4e64ad5f0ad3719cb7'
            'c39e5150702006ecabbb88c14e2319153296e9cf5c8e0278ebcf7fc66603c85a'
            '5234787a01cd2dda127c7dfd066f8e3c9e4bf953b631304340e6f1ddc9d876bd'
            '6aa86c7375a29ead4444e669f3ff880c4512591f1c939195c379203b323917f4'
            '1b2e522770c61a18ee68ce99510a03e452c9bcda3e39ced585059e7b29ebdc36'
            'e51bc1aba0e98f1af8a6f6b04b66ab519f3e0933bd52cf724dc4d00bc064f5cc'
            '31ed9560b395a4a7cb46acd54f429426ecc4b7463b1ee46046786c8ccbe44f5b'
            '856eeedcc5a6fa808b2f2ad8d210d441b08c6106fc145b81bbc26af649734a8d'
            '1a2941de50f881fe2e91fc2816c08be6d30349fc2e5f2483f027ee553ec7cb30'
            '679d1c28981afdfa8ded5e6f89765a1a1fe7f2beab74e14b58bcc823cb581fdf'
            '58a891b6c364090d56a14a84b1e55fc7993c3f0c071fce69f257b452cab03308'
            '3281ff1522634f77471bb97e709dd3dfcb88f1907c85a6d8c7c962c7b2b30575'
            '69ca5447db5443ef9539033cb72dfd08b0a62f034757a8aeefa9b57657fc6e60'
            'dcaa4d091721a1493b7e0c70c5b15d94af459905b9c9ef76d33d5211b6136645'
            '2497ffb697f5ac9fc55c67674b672200548955ff0a3c73d6f9c5b2256e2a6138'
            '724e18f309576d27bc17b70f3719fb8db7d82917d99f04f37da420219e769c93'
            'af9b112d1140c7f8028bc8150b5b42bb8b8397c590bc15017c9a1f5feee22dae'
            'eef29d471bd9645b41b6ecbb1042d669290c0550c9afb990f16d75b372f2c524'
            'ec552ded4e07ab4325ba946d9bfb86b3d109cdecb3fd574a4b263bca1ffc6295'
            '7ec4ac55ca86c862c27790ba60120738138d6cb725d12f8f6e8da7a762111a2e'
            '55bf4c426ee0a9c637832229e188cfa3bd0be48a190289a0aa5fbc4b78b5bca3'
            'ba93f62e249f2713dbfe6c82de1be4ac655264d6407ed3dc5e05323027520f31'
            '4c775c38cf1e3c534ef0ca52ca6c7a890fe169981af66141c713e054e68930a9'
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
