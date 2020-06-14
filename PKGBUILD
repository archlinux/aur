# Maintainer: Famiu Haque <famiuhaque@gmail.com>
pkgname=goneovim-bin
pkgver=0.4.6
pkgrel=1
pkgdesc='Neovim GUI written in Golang, using a Golang qt backend'
arch=('x86_64')
url='https://github.com/akiyosi/goneovim'
license=('MIT')
depends=('neovim' 'glibc' 'gcc-libs' 'libx11' 'nss' 'nspr' 'fontconfig' 'freetype2' 'expat' 'zlib' 'libglvnd' 'libxcb')
source=("https://github.com/akiyosi/goneovim/releases/download/v$pkgver/Goneovim-$pkgver-linux.tar.bz2" 'goneovim.desktop' 'goneovim.ico')
sha256sums=('d7a15761c55567871e324ef12812efe4497a4a7e9bfe55b6263e2a70595531fb'
            'bb7dd036f10fe1e9132d2bbbf346e99234425b012fadf177bb212c472ac5fca0'
            '0a36211b6ada93d811575b5ca9b33511e405f61cca791858ea2fe1eb5d29279e')

package()
{
	install -Dm644 "${srcdir}/goneovim.ico" "${pkgdir}/usr/share/pixmaps/goneovim.ico"
	install -Dm644 "${srcdir}/goneovim.desktop" "${pkgdir}/usr/share/applications/goneovim.desktop"
	
	mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
	cp -r "${srcdir}/Goneovim-${pkgver}-linux" "${pkgdir}/opt/goneovim"
	ln -snf "/opt/goneovim/goneovim" "${pkgdir}/usr/bin/goneovim"
}
