# Maintainer: Eugene Dementyev <e@dementyev.me>
pkgname=ecs-tool
pkgver=1.9.4
pkgrel=1
epoch=
pkgdesc="ecs-tool can run commands on an ECS cluster and deploy services onto it"
arch=(x86_64)
url="https://github.com/springload/ecs-tool"
license=('Apache License 2.0')
groups=()
depends=()
makedepends=(go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-$pkgver.tar.gz::https://github.com/springload/ecs-tool/archive/$pkgver.tar.gz")
noextract=()
md5sums=(15254dc75ec6e40aa74933af8cb1b129)
validpgpkeys=()

build() {
	cd "${pkgname}-${pkgver}"
	go build .
}


package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 ecs-tool "$pkgdir/usr/bin/ecs-tool"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
