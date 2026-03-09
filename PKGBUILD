# Maintainer: marco melletti <mellotanica@gmail.com>
pkgname=formula-vst3
pkgver=1.2.2
pkgrel=1
pkgdesc="Formula is an open-source VST & AU plugin to create custom audio effects inside your DAW."
arch=('x86_64')
url="https://github.com/soundspear/formula"
license=('BSL-1.0')
groups=('pro-audio' 'vst3-plugins')
depends=( 'alsa-lib' 'brotli' 'bzip2' 'boost183-libs' 'cpprestsdk' 'expat' 'fontconfig' 'freetype2' 'glibc' 'libgcc' 'libpng' 'libstdc++' 'openssl' 'zlib')
optdepends=('vst3-host')
install=
source=("https://github.com/soundspear/formula/releases/download/${pkgver}/formula-linux.tgz")
sha256sums=('d7bfd2ebcc8b64a6bc6a07bf1125c24c190a607c849d2fb68171c1c8a3e2fd87')

package() {
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib/vst3/"
    ln -sf "/usr/lib/libboost_filesystem.so.1.83.0" "$pkgdir/usr/lib/libboost_filesystem.so.1.84.0"
    mv "$srcdir/Formula" "$pkgdir/usr/bin/"
    mv "$srcdir/Formula.vst3" "$pkgdir/usr/lib/vst3/"
}
