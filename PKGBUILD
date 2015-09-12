# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: attila589 <attila589 at gmail dot com>

pkgname=tal-plugins
pkgver=20140826
_pkgver=2014-08-26
pkgrel=1
pkgdesc="Togu Audio Line VST plugins - NoiseMaker, Dub III, Filter, Filter II, Reverb, Reverb II, Reverb III, Vocoder II - ported and compiled for Linux"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net"
depends=('freetype2' 'libxext' 'gcc-libs')
license=('GPL')
source=("http://sourceforge.net/projects/distrho/files/"$_pkgver"/tal-plugins-linux32bit.tar.xz")
md5sums=('298a31d4c80b81be0cd3cc5b3dc093dc')
sha256sums=('736c04186d0ae9f318d45542a365f6007b71a2505aea4a4600a054d22f3fa968')
if [[ $CARCH == x86_64 ]]; then
  source=("http://sourceforge.net/projects/distrho/files/"$_pkgver"/tal-plugins-linux64bit.tar.xz")
  md5sums=('f255165b25528ebf2f9ebfbe917f131d')
  sha256sums=('32560e2d891b3b38ae7184c8d94de107b61738caa865f86afe76f795837130d5')
fi

package() {
  mkdir -p "${pkgdir}/usr/lib/vst"
  cp */*.so "${pkgdir}/usr/lib/vst"
}
