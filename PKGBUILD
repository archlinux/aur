# Maintainer: Bruno Ancona <brunoanconasala@gmail.com>
# Contributor: Famiu Haque <famiuhaque@gmail.com>
pkgname=goneovim-bin
pkgver=0.4.12
pkgrel=1
pkgdesc='Neovim GUI written in Golang, using a Golang qt backend'
arch=('x86_64')
url='https://github.com/akiyosi/goneovim'
license=('MIT')
depends=('neovim' 'glibc' 'gcc-libs' 'libx11' 'nss' 'nspr' 'fontconfig' 'freetype2' 'expat' 'zlib' 'libglvnd' 'libxcb')
source=("https://github.com/akiyosi/goneovim/releases/download/v$pkgver/Goneovim-v$pkgver-linux.tar.bz2" 'goneovim.desktop' 'goneovim.ico')
sha256sums=('b0ad2dff0fe82ffd6009af2e311fc36f8b3ba2df8230244752a585fc08450859'
            'bb7dd036f10fe1e9132d2bbbf346e99234425b012fadf177bb212c472ac5fca0'
            '0a36211b6ada93d811575b5ca9b33511e405f61cca791858ea2fe1eb5d29279e')

package()
{
	install -Dm644 "${srcdir}/goneovim.ico" "${pkgdir}/usr/share/pixmaps/goneovim.ico"
	install -Dm644 "${srcdir}/goneovim.desktop" "${pkgdir}/usr/share/applications/goneovim.desktop"

	mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
	cp -r "${srcdir}/Goneovim-v${pkgver}-linux" "${pkgdir}/opt/goneovim"
	ln -snf "/opt/goneovim/goneovim" "${pkgdir}/usr/bin/goneovim"
}
