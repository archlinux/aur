# Maintainer: Michael J. Pento <mjpento@verizon.net>

pkgname=ant-gtk-theme
pkgver=1.1.0
pkgrel=5
pkgdesc="Ant Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856

depends=('gtk3')

_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1525899974/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant.tar"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1526696980/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Bloody.tar"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1525239130/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Nebula.tar"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1525239091/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Dracula.tar"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1525239087/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Dracula-slim.tar.xz"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1525239127/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Nebula-slim.tar.xz"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1526696975/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Bloody-slim.tar.xz"
	"https://dl.opendesktop.org/api/files/downloadfile/id/1525899970/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-slim.tar.xz")

sha256sums=('c7e3b91ec8aae66cfe3de15a4595d3413575b7d7d410ff01f479a89a0af72cbb'
	'049ad2d833045c746d68770f7182d08ab2e08906b85281c9bbfac0289fc8709b'
	'0b7d05c11c8f4a50f09dae2555f691e68fede837cd839d735fd750bc3175c57d'
	'203be8c1bc88598f7e72b26affe14e86bb98f99f8a43acdf48b7f40e6ed79d2b'
	'4874d244df55e7caf15623d8bff0e03318c917ff09a0af2c9498dcd6adc00451'
	'f81cd6b8c0845a41d416beaca1a0c93d171a0231e3e707469cb38d7a670f47e9'
	'7d18cefffc6627d14013919d6c4f0c0b52148dbfad920d8f656c33850a90972f'
	'3c4f359233e03b2658da380f28a051d25bffaa9f9eb556842f22e2f54f9eba7a')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
