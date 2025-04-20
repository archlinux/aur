pkgbase=5db5-equalizer
pkgname=( ${pkgbase}-{lv2,vst3}-bin )
pkgver=1.0.0
pkgrel=2
arch=('x86_64')
url="https://audioassault.mx/plugin/Equalizer551"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs')
provides=('5db5-equalizer')
source=('https://5db5public.s3.amazonaws.com/Equalizer551Linux.zip')
sha256sums=('0a4bb2ab6a4d79624b4be04ad74fc05e06515ca9edef33011393d14987897354')

package_5db5-equalizer-lv2-bin() {
    ## Install LV2 Plugin
    pkgdesc="British Style EQ (LV2)"
    groups=('pro-audio' 'lv2-plugins')
    install -Dm755 "$srcdir/Equalizer551.lv2/Equalizer551.so" "$pkgdir/usr/lib/lv2/Equalizer551.lv2/Equalizer551.so"
    install -Dm644 "$srcdir/Equalizer551.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/Equalizer551.lv2/dsp.ttl"
    install -Dm644 "$srcdir/Equalizer551.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/Equalizer551.lv2/manifest.ttl"
    install -Dm644 "$srcdir/Equalizer551.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/Equalizer551.lv2/ui.ttl"
}

package_5db5-equalizer-vst3-bin() {
    ## Install VST3 Plugin
    pkgdesc="British Style EQ (VST3)"
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/Equalizer551.vst3/Contents/Resources/moduleinfo.json" "$pkgdir/usr/lib/vst3/Equalizer551.vst3/Contents/Resources/moduleinfo.json"
    install -Dm755 "$srcdir/Equalizer551.vst3/Contents/x86_64-linux/Equalizer551.so" "$pkgdir/usr/lib/vst3/Equalizer551.vst3/Contents/x86_64-linux/Equalizer551.so"
}
