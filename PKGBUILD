# Maintainer: robertfoster

_gitname=tinyMediaManager
pkgname=tiny-media-manager-bin
pkgver=2.9.12
build=597414a
pkgrel=1
pkgdesc="A multi-OS media managment tool"
arch=('any')
url="http://www.tinymediamanager.org"
license=('Apache-2.0')
depends=('libmediainfo' 'java-environment>=8')
noextract=("tmm_${pkgver}_${build}_linux.tar.gz")
source=("https://release.tinymediamanager.org/dist/tmm_${pkgver}_${build}_linux.tar.gz"
	"tinyMediaManager.desktop"
	"tinymediamanager"
"tinymediamanager-cli")

package() {
	destpath="$pkgdir/usr/share/$_gitname"
	mkdir -p $destpath

	tar -xvf tmm_"$pkgver"_*_linux.tar.gz -C $destpath
	rm tmm_"$pkgver"_*_linux.tar.gz

	chmod -R 777 "$pkgdir/usr/share/$_gitname"

	# Install desktop entry
	install -D "$srcdir/tinyMediaManager.desktop" "$pkgdir/usr/share/applications/tinyMediaManager.desktop"
	install -D $destpath/tmm.png $pkgdir/usr/share/pixmaps/tmm.png

	# Install launch scripts
	install -D "$srcdir/tinymediamanager-cli" "$pkgdir/usr/bin/tinymediamanager-cli"
	install -D "$srcdir/tinymediamanager" "$pkgdir/usr/bin/tinymediamanager"
}
md5sums=('9d357619b445e2d9733bae85da542fc5'
         '9cc43e1296880768bacc51c63f913cbd'
         'c382f9ba03915a1f70f5aaea8699cfe5'
         '677bed3f438e84ecd948c9f6faa37194')
