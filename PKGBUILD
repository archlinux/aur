# Maintainer: unstartdev <guo.yongan@outlook.com>
pkgname=brook-systemd
pkgver=v20180112
pkgrel=1
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
	"https://github.com/unstartdev/brook-systemd/releases/download/Alpha/EnvironmentFile")
noextract=('brook' 'brook-client.service' 'EnvironmentFile')
md5sums=('534fc9e7a83a8cf97a102d742213a20e'
         '92f6c380e78373a6336c868f64f5cd53'
         '1c648f27d886ad69415a5be70b31e9e1')
validpgpkeys=()

package() {
	install -D brook $pkgdir/opt/brook
	install -Dm644 brook-client.service $pkgdir/usr/lib/systemd/system/brook-client.service
	install -Dm644 EnvironmentFile $pkgdir/etc/default/brook
}
