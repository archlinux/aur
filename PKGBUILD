# Maintainer: Eugene Dementyev <e@dementyev.me>
pkgname=aws-ssh
pkgver=2.1.3
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
md5sums=(a5d40c229c789a29944aa52a453b0836)
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
