# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=11.3.5
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')
optdepends=('xdg-utils')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('473dae24485fdace2f39f16a7b1e3b80820c860c990fff770d487c33315444f46b438ae0d0c8f4187d81f828bfc0fcac18e1523c63843e630081d9a2dd11a03c')
[ "$CARCH" = "x86_64" ] && sha512sums=('f6eaa1e6e13474ae60818b38ae9ed3c97d693c24c6e21fd4aa96dba59d5e4dd6551c875e17aa646b4e00381e653fcde3c9a169988fa1b5dc94d323e036851909')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
