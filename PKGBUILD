# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=tg
pkgname=telegram-$_pkgname
pkgver=0.16.0
pkgrel=1
pkgdesc="terminal telegram client that really works"
arch=('any')
url="https://github.com/paul-nameless/tg"
license=('Unlicense')
depends=('python-telegram=0.14.0' 'python3')
makedepends=('python-setuptools')
optdepends=(
	'libnotify: for notifications, you could also use other programs: see config'
	'ffmpeg: to record voice msgs and upload videos correctly'
	'urlview: to choose urls when there is multiple in message, use URL_VIEW in config file to use another app, it should accept urls in stdin'
	'ranger: can be used to choose file when sending, customizable with FILE_PICKER_CMD'
	'nnn: can be used to choose file when sending, customizable with FILE_PICKER_CMD'
	'fzf: to create groups and secret chats, used for single and multiple user selection'
)
conflicts=('telegram-tg-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('e189bf5475d0b379ba6de8421b73ea91')

build() {
	cd "$_pkgname-$pkgver"

	python3 setup.py build
}

package() {
	cd "$_pkgname-$pkgver"

	python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
