# Maintainer: Denis Sheremet <aur@lxlz.space>

pkgname=yandex-browser-ffmpeg-codecs-update-hook
pkgver=0.0.1
pkgrel=1
pkgdesc="alpm-hook to automatically update yandex-browser's ffmpeg codecs on package update"
arch=('any')
license=('GPL')
depends=('yandex-browser-beta' 'jq' 'wget')
conflicts=('yandex-browser-ffmpeg-codecs' 'yandex-libffmpeg')
provides=('yandex-browser-ffmpeg-codecs' 'yandex-libffmpeg')

package() {
	mkdir -p "$pkgdir/opt/yandex/browser-beta"
	touch "$pkgdir/opt/yandex/browser-beta/libffmpeg.so"
        
        mkdir -p "$pkgdir/usr/share/libalpm/hooks/"
        install -Dm644 "$srcdir/../yandex-browser-ffmpeg-codecs-update.hook" "$pkgdir/usr/share/libalpm/hooks/"
}
