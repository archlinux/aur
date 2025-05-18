# Maintainer: Mus <sonics0977703996@gmail.com>
pkgname=lane-adb
pkgver=1.1
pkgrel=1
pkgdesc="Launcher for Lane via adb and usb"
arch=('any')
url="https://github.com/musdev13/lane-adb"
license=('unknown')
depends=('android-tools' 'gnirehtet-bin' 'scrcpy' 'wget')
makedepends=('git')
source=("lane-adb::git+https://github.com/musdev13/lane-adb.git")
md5sums=('SKIP')

package() {
	cd "$pkgname"
	install -Dm755 ./lane "$pkgdir/usr/bin/lane"
	install -d "$pkgdir/usr/share/lane"
	cp -r res/share/* "$pkgdir/usr/share/lane/"
	for f in res/applications/*.desktop; do
  		install -Dm644 "$f" "$pkgdir/usr/share/applications/$(basename "$f")"
	done
}
