# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.6.0
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
sha512sums=('8a3aef435ad04fbcaf7ae3e7abf0ca3897f96fced359ae02cb5b8421d071547d1a116605ee061cacfdfa5c21b4077262beab8efe0d358e16e4c978f4c1483f67')
[ "$CARCH" = "x86_64" ] && sha512sums=('7bfb61c59f4a9ad6cfd0007714be9a2d7778434773828433b71bb13ca410df9647bcc3fdd41e1941e3d7acecb048b52361e222faf81bc396336ee5bf0ada896b')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
