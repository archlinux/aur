pkgbase=5db5-channel
pkgname=('5db5-channel-data-bin' '5db5-channel-lv2-bin' '5db5-channel-vst3-bin')
pkgver=1.0.1
pkgrel=3
arch=('x86_64')
url="https://audioassault.mx/plugin/Channel551"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs')
provides=('5db5-channel')
source=('https://5db5public.s3.amazonaws.com/Channel551Linux.zip'
        'Channel551 Linker')
sha256sums=('3363742449270118ce5807c6081ddb7e50537eb76d55720e4662b1a881f851c8'
            '35041e56af62e7d07d1a2920fa1fb0d0af14bb570968e74eab33a57005c797f0')

package_5db5-channel-data-bin() {
    ## Install Asset Data
    pkgdesc="British Style Channel Strip (Data Assets)"
    groups=('pro-audio')

    ## Make data assets dir
    mkdir -p "$pkgdir/usr/lib/5db5/Channel551/Presets"

    ## Copy assets to data directory
    cp -r "$srcdir/Presets"/* "$pkgdir/usr/lib/5db5/Channel551/Presets"

    ## Install Double Take Linker Script
    install -Dm755 "$srcdir/Channel551 Linker" "$pkgdir/usr/bin/Channel551 Linker"
}

package_5db5-channel-lv2-bin() {
    ## Install LV2 Plugin
    pkgdesc="British Style Channel Strip (LV2)"
    groups=('pro-audio' 'lv2-plugins')
    install -Dm755 "$srcdir/Channel551.lv2/Channel551.so" "$pkgdir/usr/lib/lv2/Channel551.lv2/Channel551.so"
    install -Dm644 "$srcdir/Channel551.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/Channel551.lv2/dsp.ttl"
    install -Dm644 "$srcdir/Channel551.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/Channel551.lv2/manifest.ttl"
    install -Dm644 "$srcdir/Channel551.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/Channel551.lv2/ui.ttl"
}

package_5db5-channel-vst3-bin() {
    ## Install VST3 Plugin
    pkgdesc="British Style Channel Strip (VST3)"
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/Channel551.vst3/Contents/Resources/moduleinfo.json" "$pkgdir/usr/lib/vst3/Channel551.vst3/Contents/Resources/moduleinfo.json"
    install -Dm755 "$srcdir/Channel551.vst3/Contents/x86_64-linux/Channel551.so" "$pkgdir/usr/lib/vst3/Channel551.vst3/Contents/x86_64-linux/Channel551.so"
}
