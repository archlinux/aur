# Maintainer: marco melletti <mellotanica@gmail.com>
pkgname=formula-vst3
pkgver=1.2.2
pkgrel=2
pkgdesc="Open-source audio effects as code editor VST3 plugin and standalone application."
arch=('x86_64')
url="https://github.com/soundspear/formula"
license=('BSL-1.0')
groups=('pro-audio' 'vst3-plugins')
depends=('alsa-lib' 'brotli' 'bzip2' 'boost183-libs' 'cpprestsdk' 'expat' 'fontconfig' 'freetype2' 'glibc' 'libgcc' 'libpng' 'libstdc++' 'openssl' 'zlib')
optdepends=('vst3-host')
install=
source=("https://github.com/soundspear/formula/releases/download/${pkgver}/formula-linux.tgz" "formulavst.png::https://github.com/soundspear/formula/blob/${pkgver}/assets/formula_icon.png?raw=true")
sha256sums=('d7bfd2ebcc8b64a6bc6a07bf1125c24c190a607c849d2fb68171c1c8a3e2fd87' 'bdfad41978c0470f80a85753f53cc426ec48e40a5aa77fa6c80f469b93111a71')

package() {
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib/vst3/" "$pkgdir/usr/share/pixmaps" "$pkgdir/usr/share/applications"
    ln -sf "/usr/lib/libboost_filesystem.so.1.83.0" "$pkgdir/usr/lib/libboost_filesystem.so.1.84.0"
    mv "$srcdir/Formula" "$pkgdir/usr/bin/"
    mv "$srcdir/Formula.vst3" "$pkgdir/usr/lib/vst3/"
    cp "$srcdir/formulavst.png" "$pkgdir/usr/share/pixmaps/"

    echo '[Desktop Entry]
Name=Formula
GenericName=Formula VST Standalone
Comment=Audio effects as code editor standalone application
Exec=Formula
Icon=formulavst
Terminal=false
Type=Application
Categories=AudioVideo;Audio;AudioEditing;X-AudioEditing;X-Jack;
' > "$pkgdir/usr/share/applications/formula.desktop"
}
