# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=denaro
_pkgname=nickvisionmoney
_pkgid=org.nickvision.money
pkgver=2023.4.0
pkgrel=2
pkgdesc="A personal finance manager"
arch=(aarch64 armv7h x86_64 i686)
url=https://github.com/NickvisionApps/$pkgname
license=(GPL3)
depends=('dotnet-runtime>=7' libadwaita)
makedepends=(blueprint-compiler 'dotnet-sdk>=7' git just)
source=(git+$url#tag=$pkgver)
b2sums=('SKIP')

build() {
	just $pkgname/NickvisionMoney.GNOME/ publish /usr
}

package() {
	just $pkgname/NickvisionMoney.GNOME/ install "$pkgdir"
}
