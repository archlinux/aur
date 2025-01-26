# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.7.2
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
sha512sums=('25b25edf2c20cbb9bf473c818539bf891857100d0fb13a97a4b9564ef46c5c3ce9f3dd9d809dbd8dbd7a45831c690f2dd6b2400ccc7dcc92102e76a60600b48f')
[ "$CARCH" = "x86_64" ] && sha512sums=('b9f9fa85c25f6ac254cfffcc52759bc593522576a5c39a311daea8e25ff331f6a951103661b0b6f64a7d71d2cb4b83c38148b320dec1e3bc5366d68b76ec99f1')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
