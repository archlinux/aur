# Maintainer: Francesco Albanese <frances dot albanese at gmail dot com>
pkgname=vim-easytags
pkgver=3.10.1
pkgrel=1
pkgdesc="Automatically create a global tags file with ctags and keep it up-to-date as you edit files in Vim."
arch=(any)
url="https://github.com/xolox/vim-easytags"
license=('MIT')
groups=('vim-plugins')
depends=("vim" "ctags" "vim-misc-xolox" "python")
source=($pkgname-$pkgver.tar.gz::https://github.com/xolox/$pkgname/tarball/$pkgver)
noextract=()
sha256sums=('7378f6500543ea546c423666c76fe7ff8b234d9040fcc3ced4aae4f439bb9e11')

package() {
  _gittag=a339a8c
  cd "$srcdir/xolox-$pkgname-$_gittag"
  install -D -m644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm 755 ${pkgdir}/usr/share/vim/vimfiles/
  tar -c . \
	--exclude INSTALL.md \
        --exclude README.md  \
	--exclude TODO.md \
	--exclude .gitignore \
	--exclude addon-info.json \
	| tar -x -C ${pkgdir}/usr/share/vim/vimfiles
}
