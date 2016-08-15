# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=tinyssh-convert
pkgver=0.1
pkgrel=1
pkgdesc="converter for ed25519 keys from OpenSSH to TinySSH format"
arch=('x86_64' 'i686')
url="https://github.com/ansemjo/tinyssh-convert"
license=('MIT')
makedepends=('autoconf')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d592bf1981dc4074912a6fec3e55ab5fbef1f61f1bfcdaf147ecb640e95b220df3bbedd55e8cf764ec37ba820eccd36621c7a73e2b07ba8557ea74a7f417802e')

build() {
	cd "$pkgname-$pkgver"
        ./build.sh
}

package() {
	cd "$pkgname-$pkgver"
        install -Dm 755 ${pkgname} $pkgdir/usr/bin/${pkgname}
}
