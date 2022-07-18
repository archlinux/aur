# Maintainer: Eugene Dementyev <e@dementyev.me>
pkgname=aws-ssh
pkgver=2.2.9
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
md5sums=(ca3eb2d56840f840c49dbf1e8b4e8823)
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
