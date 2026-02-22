pkgname=opera-gx-stable-ffmpeg-codecs-bin
pkgver=127.0.5778.75
_nwjsver=0.108.0
pkgrel=1
epoch=1
pkgdesc="Additional support for proprietary codecs for opera-gx-stable using prebuilt FFmpeg binaries made for NW.js."
arch=('x86_64')
url="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/"
options=('!debug')
license=('LGPL2.1')
depends=('opera-gx-stable')
provides=('opera-gx-stable-ffmpeg-codecs')
conflicts=('opera-gx-stable-ffmpeg-codecs')
source=(
  "https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/download/${_nwjsver}/${_nwjsver}-linux-x64.zip"
  disable-opera-gx-stable-default-ffmpeg.hook
  enable-opera-gx-stable-default-ffmpeg.install
)
install=enable-opera-gx-stable-default-ffmpeg.install
sha512sums=('SKIP'
            '7b48bbaba2f664412946e05127198d97f815217a0116b2b8e0d6be70c9e2d9e59eb8df3b30c67f45c0f876636f0d3ffb03d51643c0388e8783a3a976c8a7e9ec'
            '75888b4e99f2eb3e0c233f9331b800cb7e39d29a0bde5ea632efefb2a138bff4d2a5b276b1d21b215688b2a2774b24c217e6c4063e2698d1e8bd315e4417e0bd')

package() {
  install -Dm644 "$srcdir/libffmpeg.so" "$pkgdir/usr/lib/opera-gx-stable/lib_extra/libffmpeg.so"
  install -Dm644 disable-opera-gx-stable-default-ffmpeg.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
