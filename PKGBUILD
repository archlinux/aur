# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.4.0
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
sha512sums=('97d0fe20fb7e5e5053f8112b07ebeb8aa3f1adfdd2a3c94f33b1a7d41417ca38e8cc3fc5972eee1585c52fc5b9a440df112da21b804f7525cd5928d0feb8da9d')
[ "$CARCH" = "x86_64" ] && sha512sums=('97d0fe20fb7e5e5053f8112b07ebeb8aa3f1adfdd2a3c94f33b1a7d41417ca38e8cc3fc5972eee1585c52fc5b9a440df112da21b804f7525cd5928d0feb8da9d')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
