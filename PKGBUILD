# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname='warspear'
pkgver=12.4.2
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
sha512sums=('18f7763e9e51a3d49488d3ebfe9645999da5c08e669fecb6a11aaaf3a40a1f8ad49a779dcfbd5011e0d8668da174e875aadf2e0cd8f58a1f7a253f65af1fb9b4')
[ "$CARCH" = "x86_64" ] && sha512sums=('663e08ef1ad15086c0af3f6c5321b25a7e383fb10b5db5a73501ca79ce8974406917471a26bc7d1851b197aad6c720eb87b2b29fd1ed0d4697b5cb841f1ebb63')

prepare() {
    tar -xf data.tar.xz
}
package() {
    cp -dr --no-preserve=ownership opt usr  "$pkgdir"/
}
