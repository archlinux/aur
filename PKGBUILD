# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=8.4.1
pkgrel=0
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('31ef9268c95c5de7d89cbfd7ac7478c77c2bf66a7dc33565b4e6b9df195bd7961529f91377b375d20000b1170b7bf25a422c19868b7c34d23b149253fff1b135')
[ "$CARCH" = "x86_64" ] && sha512sums=('59c6505f4584e6058243808a22c31dda6d2298654699d6a18e3bfa4f17b1613565ee3d8662d53c8ffd604bc8bd9a0665ac5834e17752ed743939595b8d0d5848')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
