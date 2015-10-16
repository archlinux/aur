# Maintainer: Dmitrij D. Czarkoff <czarkoff@gmail.com>
pkgname=baresip
pkgver=0.4.15
pkgrel=1
pkgdesc="portable and modular SIP User-Agent with audio and video support"
arch=('i686' 'x86_64')
url="http://creytiv.com/baresip.html"
license=('BSD')
depends=('rem')
optdepends=('alsa-lib: (alsa module)'
            'ffmpeg: (avcodec, avformat, h265 modules)'
            'cairo: (cairo, rst modules)'
            'spandsp: (g722, g726 modules)'
            'gsm: (gsm module)'
            'gst-plugins-bad: (gst1, gst_video1 modules)'
            'gst-plugins-base: (gst1, gst_video1 modules)'
            'gst-plugins-good: (gst1, gst_video1 modules)'
            'gst-plugins-ugly: (gst1, gst_video1 modules)'
            'gtk2: (gtk module)'
            'libsrtp: (libsrtp module)'
            'opus: (opus module)'
            'spandsp: (plc module)'
            'mpg123: (rst module)'
            'sdl: (sdl module)'
            'sdl2: (sdl2 module)'
            'libsndfile: (sndfile module)'
            'speex: (speex module)'
            'speexdsp: (speex_aec, speex_pp modules)'
            'v4l-utils: (v4l2 module)'
            'libvpx: (vpx module)'
            'libx11: (x11 module)'
            'libx11: (x11grab module)')
makedepends=${optdepends[@]/%:*/}
#changelog=ChangeLog
source=("http://creytiv.com/pub/$pkgname-$pkgver.tar.gz")
md5sums=('e304d698bb593f296793acac752685a7')

build() {
	cd "$pkgname-$pkgver"
	make EXTRA_MODULES="h265" USE_GST= USE_GST_VIDEO= PREFIX="/usr"
}

package() {
	cd "$pkgname-$pkgver"
	make EXTRA_MODULES="h265" USE_GST= USE_GST_VIDEO= PREFIX="/usr" \
		DESTDIR="$pkgdir/" install
}
