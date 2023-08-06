# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=11.4.2
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
sha512sums=('b51d717a1f0d33a140161be4f4e76c976c0041d0e257a48733436fcc9ce36813a4524e78bbaaa06638aa1ca744740772bb843c355e6ef7f9c8aac1af0f88eca5')
[ "$CARCH" = "x86_64" ] && sha512sums=('9c09c108dcfdab62096bad529260012adbf4dd5e88ec2f2f4fd57880c3d58d1660249abec62b9387a6e885bcf732d4704bd24053c4556d269c988cb7149c4c35')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
