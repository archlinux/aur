# Maintainer: unstartdev <guo.yongan@outlook.com>
pkgname=brook-systemd
pkgver=v20180112
pkgrel=3
epoch=
pkgdesc="Install brook(client) with systemd"
arch=('x86_64')
url="https://github.com/txthinking/brook"
license=('GPL')
groups=()
depends=('systemd')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/txthinking/brook/releases/download/${pkgver}/brook"
	"https://github.com/unstartdev/brook-systemd/releases/download/Alpha/brook-client.service"
	"https://github.com/unstartdev/brook-systemd/releases/download/Alpha/brook-client-http.service"
	"https://github.com/unstartdev/brook-systemd/releases/download/Alpha/EnvironmentFile")
noextract=('brook' 'brook-client.service' 'brook-client-http.service' 'EnvironmentFile')
md5sums=('534fc9e7a83a8cf97a102d742213a20e'
         '92f6c380e78373a6336c868f64f5cd53'
         '080be0199ac52c95e2c1662584b04f6f'
         '7b3b6aefc53b692eb21a4220a9d4a00a')
validpgpkeys=()

package() {
	install -D brook $pkgdir/opt/brook
	install -Dm644 brook-client.service $pkgdir/usr/lib/systemd/system/brook-client.service
	install -Dm644 brook-client-http.service $pkgdir/usr/lib/systemd/system/brook-client-http.service
	install -Dm644 EnvironmentFile $pkgdir/etc/default/brook
}
