# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bruno Ancona <brunoanconasala@gmail.com>
# Contributor: Famiu Haque <famiuhaque@gmail.com>

pkgname=goneovim-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Neovim GUI written in Golang, using a Golang qt backend'
arch=(x86_64)
url='https://github.com/akiyosi/goneovim'
license=(MIT)
depends=(expat
         fontconfig
         freetype2
         gcc-libs
         glibc
         libglvnd
         libx11
         libxcb
         neovim
         nspr
         nss
         zlib)
provides=("${pkgname%-bin}=$pkgver")
conflicts=(${pkgname%-bin})
source=("$url/releases/download/v$pkgver/Goneovim-v$pkgver-linux.tar.bz2"
        goneovim.desktop
        goneovim.ico)
sha256sums=('e1b611939f02bff62f861fd65e24297d780ff8dffa48c9b2021d2a334ba891e5'
            'bb7dd036f10fe1e9132d2bbbf346e99234425b012fadf177bb212c472ac5fca0'
            '0a36211b6ada93d811575b5ca9b33511e405f61cca791858ea2fe1eb5d29279e')

package() {
	install -Dm0644 -t "$pkgdir/usr/share/pixmaps/" goneovim.ico
	install -Dm0644 -t "$pkgdir/usr/share/applications/" goneovim.desktop
	mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
	cp -r "Goneovim-latest-linux" "$pkgdir/opt/goneovim"
	ln -snf "/opt/goneovim/goneovim" "$pkgdir/usr/bin/goneovim"
}
