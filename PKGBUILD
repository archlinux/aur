# Maintainer: Daniil Gentili <daniil@daniil.it>

pkgname=cabbage-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Framework for developing audio plugins with the Csound programming language."
arch=(x86_64)
url="https://cabbageaudio.com/"
license=('GPL')
provides=(cabbage)
depends=(csound)

_ver=2.8
source_x86_64=("https://github.com/rorywalsh/cabbage/releases/download/v${pkgver}/Cabbage-${_ver}-DEB.zip")

package() {
	bin_path="$pkgdir/usr/bin"
	icon_path="$pkgdir/usr/share/icons/hicolor/512x512/apps"
	doc_path="$pkgdir/usr/share/doc/cabbage"
	theme_path="$pkgdir/usr/share/cabbage"
	desktop_path="$pkgdir/usr/share/applications"

	build_path="./CabbageLinux/install"

	install -Dm644 -t "$icon_path" "$build_path"/images/* 
	install -Dm755 -t "$bin_path" "$build_path"/bin/* 
	install -Dm644 -t "$desktop_path" "$build_path"/desktop/* 

	install -d "$doc_path"
	cp -r "${build_path}/Examples" "$doc_path"
	chmod -R 755 "$doc_path"

	install -d "$theme_path"
	cp -r "${build_path}/Themes" "$theme_path"
	chmod -R 755 "$theme_path"
}

sha512sums_x86_64=('80097bc27c5813fe94ca598726b35b00990f58e73b0544e1eaad6bb4dc38403d6a7d792fa23e916ac8ca3b8c537ea951bf9f340a25bf2d656bd4e4f60ebbe009')
