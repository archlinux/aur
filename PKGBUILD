# Maintainer: Debendra Oli <debendraoli@pm.me>

pkgname=arduino-language-server-bin
pkgver=0.7.4
pkgrel=2
pkgdesc="An Arduino Language Server based on Clangd to Arduino code autocompletion"
arch=(x86_64)
url="https://github.com/arduino/arduino-language-server"
license=('APACHE')
provides=('arduino-language-server')
conflicts=('arduino-language-server')
source=("https://github.com/arduino/arduino-language-server/releases/download/${pkgver}/arduino-language-server_${pkgver}_Linux_64bit.tar.gz")
sha256sums=('ec248bdee8fb8d6574f736fe42aa3ac4c192d418240bfa5b43f2dc518e9e2504')

package() {
	cd "$SOURCE_DIR" || exit 1
	msg2 'Installing executables...'
	install -Dm 755 arduino-language-server -t "$pkgdir"/usr/bin
	msg2 'Installing license'
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
