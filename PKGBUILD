# Maintainer: Daniil Gentili <daniil@daniil.it>

pkgname=cabbage-bin
pkgver=2.9.0
pkgrel=1
pkgdesc="Framework for developing audio plugins with the Csound programming language."
arch=(x86_64)
url="https://cabbageaudio.com/"
license=('GPL')
provides=(cabbage)
depends=(csound)

source_x86_64=("https://github.com/rorywalsh/cabbage/releases/download/v${pkgver}/CabbageLinux-${pkgver}.zip")

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

sha512sums_x86_64=('eb502e3bcfbb5a7449c9de97b4f5b61e27dc7eeb956b93a30944fe18b85153887e693c5a80526801825aaa2f702219ffec880cfe593eb50d99e8f87f9d955863')
