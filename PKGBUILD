# Maintainer: Eugene Dementyev <e@dementyev.me>
pkgname=aws-ssh
pkgver=2.1.2
pkgrel=1
epoch=
pkgdesc="aws-ssh goes through all available AWS accounts in parallel, looks up ec2 instances and generates ssh config to access them"
arch=(x86_64)
url="https://github.com/springload/aws-ssh"
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
source=("${pkgname}-$pkgver.tar.gz::https://github.com/springload/aws-ssh/archive/v$pkgver.tar.gz")
noextract=()
md5sums=(34730b10eb370e5cda9da0857e973a33)
validpgpkeys=()

build() {
	cd "${pkgname}-${pkgver}"
	go build .
}


package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 aws-ssh "$pkgdir/usr/bin/aws-ssh"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
