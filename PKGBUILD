# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=5.8.0
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.15' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://cdn.warspear-online.com/repo/pool/non-free/binary-${_arch}/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('496b81585ec82525dcd5c19034e98bb4eee8a069fa4ced6730530d0be7b439b92fc50325b8990062c1264fad91d59c295e9f0c7f0819352e3c62133c9f1467e7')
[ "$CARCH" = "x86_64" ] && sha512sums=('820b5ea2afad49fe96bcbdf4a001477de782d713e48042a9d7afcd51794a8c05fbd2f965ed8d209c9ae7f6e9039d714bc57bdd4b9ec2c96763ae63eb922e7323')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.gz -C $pkgdir
}
