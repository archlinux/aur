# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=10.3.5
pkgrel=0
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')
optdepends=('xdg-utils')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('e99d1f6c976294d2184629b97c410b9e59d0cd1eff684280d8b4a79c62ec903c1424a20d797a30813b6a85f34994b2e51b2aa67ba8f555127fc3447fb8b2a3c8')
[ "$CARCH" = "x86_64" ] && sha512sums=('5de9bd67fe96425cd3055102e27d44e0944ed55af7dfd2b12c550a36c4c1dc53d47de4893b70f24aac4684a5ad856cf694c81edf384d26927991f1bb908c5697')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
