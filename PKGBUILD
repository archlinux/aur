# Maintainer: Sergey Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=5.6.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/repo/pool/non-free/binary-${_arch}/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('532a4149e2ce69287167bd017a9a302c056e9a480efdd5ca89db0e0cc6dca419ba11b292d87f1ac9b6a3d27518b4da770dc2ca4878a58be88bface02a602cab6')
[ "$CARCH" = "x86_64" ] && sha512sums=('808971a589c2da97417e56331320a58a4657cefc3b51cb4e91f071efc99794a05928d8959c07956aec8293790445863486a475074a1d9e69397313161c219432')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
}
