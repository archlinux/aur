pkgname=bashbullet2
pkgver=20190916
pkgrel=1
pkgdesc="A pushbullet systray notification daemon for linux. also a simple client to receive, mirror, and send pushes. version 2"
arch=('any')
url="https://github.com/Boteium/bashbullet2"
license=('GPL')
depends=(libnotify yad xclip libwebsockets curl openssl)
install="bashbullet2.install"
source=('git://github.com/Boteium/bashbullet2.git')
md5sums=('SKIP')

build(){
	cd "$srcdir/bashbullet2/src"
	make
}

package() {
	cd "$srcdir/bashbullet2"

	install -Dm 755 bashbullet2 "$pkgdir/usr/bin/bashbullet2"

	install -Dm 755 libbashbullet "$pkgdir/usr/share/bashbullet2/libbashbullet"
	install -Dm 755 ./config_dir/lib/helper "$pkgdir/usr/share/bashbullet2/lib/helper"
	install -Dm 755 ./config_dir/lib/helper_upload "$pkgdir/usr/share/bashbullet2/lib/helper_upload"

	install -Dm 755 ./config_dir/lib/create_device.sh   "$pkgdir/usr/share/bashbullet2/lib/create_device.sh"
	install -Dm 755 ./config_dir/lib/new_push.sh   "$pkgdir/usr/share/bashbullet2/lib/new_push.sh"
	install -Dm 755 ./config_dir/lib/inbox.sh   "$pkgdir/usr/share/bashbullet2/lib/inbox.sh"
	install -Dm 755 ./config_dir/handler/clip.sh   "$pkgdir/usr/share/bashbullet2/handler/clip.sh"
	install -Dm 755 ./config_dir/handler/push.sh   "$pkgdir/usr/share/bashbullet2/handler/push.sh"
	install -Dm 755 ./config_dir/handler/mirror.sh   "$pkgdir/usr/share/bashbullet2/handler/mirror.sh"

	install -Dm 655 ./config_dir/config.json   "$pkgdir/usr/share/bashbullet2/config.json"
	install -Dm 655 ./config_dir/handler_config   "$pkgdir/usr/share/bashbullet2/handler_config"

	install -Dm 655 ./config_dir/lib/pushbullet.svg   "$pkgdir/usr/share/bashbullet2/lib/pushbullet.svg"
	install -Dm 655 ./config_dir/lib/audio/message.wav   "$pkgdir/usr/share/bashbullet2/lib/audio/message.wav"
	install -Dm 655 ./config_dir/lib/audio/bell.wav   "$pkgdir/usr/share/bashbullet2/lib/audio/bell.wav"
}
