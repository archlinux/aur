# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.3.3
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
sha512sums=('6358eea415a5e342e591b8039a596f53e12ddfd607c8b25391b2a17fb1cf93ccff48c780e427cfe5c1fd252aac069c7daf6543b5d36fc45c554446de7d41b350')
[ "$CARCH" = "x86_64" ] && sha512sums=('af6646f0ace8cae737427e5963bf4fecf8d46a18e20454c1badd5f110042a7037168e940d374b6bea8101fe8ead0bac8a61b98c63c52de8be99d50663990ec4c')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
