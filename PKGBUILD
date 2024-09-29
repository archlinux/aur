# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.5.1
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
sha512sums=('62de03ecf81aad6d00a8fbcf494af43d7e732ad3c61ef657bfb9d92d5ac6cd999360d0bc0e2957eec908ce89968de714a918e0dae323baa13f0ffd8e6c337060')
[ "$CARCH" = "x86_64" ] && sha512sums=('3b98ffd3552668b7221e08c3e1693d564bbe96cfd8e3e6f05e04ee719091e13dc985b71468ae53a69346b3771c41e8806a9145c48f63d349a5669bff33e4da15')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
