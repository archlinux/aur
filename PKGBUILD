# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.8.0
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
sha512sums=('787a24701f86c2088f75759d818d5443040cdb5b38d7c41c3064b57ffa152f9ad97afb15726979a81cf2f1ec249b130432e1ff5bd9411fbf77753a88d597f2a6')
[ "$CARCH" = "x86_64" ] && sha512sums=('25583dae099d8f8b5f0e00f920ee673da8991afa0c8360e1489661c41ff7d9894a88236334bc34402cac3fcc32664a0009d068445b9d314780aa20503813f27b')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
