# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=tg
pkgname=telegram-$_pkgname
pkgver=0.6.0
pkgrel=1
pkgdesc="terminal telegram client that really works"
arch=('any')
url="https://github.com/paul-nameless/tg"
license=('Unlicense')
depends=('python-telegram' 'python3')
makedepends=()
optdepends=(
	'libnotify: for notifications, you could also use other programs: see config'
	'ffmpeg: to record voice msgs and upload videos correctly'
	'urlview: to choose urls when there is multiple in message, use URL_VIEW in config file to use another app, it should accept urls in stdin'
)
conflicts=('telegram-tg-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('a2a3bcba007c1a79585b62511ecfc318')

build() {
	cd "$_pkgname-$pkgver"

	python3 setup.py build
}

package() {
	cd "$_pkgname-$pkgver"

	python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
