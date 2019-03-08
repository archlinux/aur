# Maintainer: Sergei Marochkin <me@ziggi.org>

pkgname='warspear'
pkgver=7.9.5
pkgrel=1
pkgdesc='Warspear Online is a cross-platform massively multiplayer online roleplaying game (MMORPG) for smart phones.'
arch=('i686' 'x86_64')
url='http://warspear-online.com/'
license=('custom')
depends=('glibc>=2.19' 'libx11' 'libgl' 'openal' 'libxft' 'zenity' 'curl')

_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'

source=("http://distr.warspear-online.com/linux/pool/non-free/w/warspear/warspear_${pkgver}_${_arch}.deb")
sha512sums=('8fc8c580a9f864e64cc531bed3f29ac1e36e99850af78f3bf3fb98b8b356a22958543dac7e47c6acfa80d800e6e55fa7e2cc3b025e53cd5aef862b3f5638ce5f')
[ "$CARCH" = "x86_64" ] && sha512sums=('229efc666ec565a4655136959f3f30658b8c8b8a84cf451823f776cdca9ae67934201c65345bdeebe5925e9be2a0be7c6db6bd15d5684ec3acdaf6649ce3ae07')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
