# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.9.3
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
sha512sums=('95961b219ad57def30074e26cb68ecaea6322291a9f5cf27eb5c87aeb3d970b0bba5227c2a2cda3481564713871014804aba8abbb8c29a9ffc55df46c999d593')
[ "$CARCH" = "x86_64" ] && sha512sums=('c9531737590df9849af1fde3b464c0a211ccc27d9241046174a23227fcdd24fdaa6ec3937fcacdb1bf8f5946f1c646d521202c6a0e05bdf7e75b9fb02a6c8f37')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
