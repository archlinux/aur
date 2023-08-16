# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=11.4.3
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
sha512sums=('a530dccc7286d6c346f30c50f5965fd1a68a3a66e33f752fe0cf8bd7906930d6f971e65247288c727144211d74a17eb46089ea1090e7712f03323e54e7a42a61')
[ "$CARCH" = "x86_64" ] && sha512sums=('b0c0741e230d12f5462b6ebe4543b01bd0d7fafe5747ed730fd6d58784324137c15a65982a1bbad812bc521337fd1dd039ee92f1d1b66ecb8766439b4ec237aa')

package() {
	cd $srcdir

	ar x *.deb
	bsdtar xf data.tar.xz -C $pkgdir
}
