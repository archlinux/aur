# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=tinyssh-convert
pkgver=0.2
pkgrel=2
pkgdesc="converter for ed25519 keys from OpenSSH to TinySSH format"
arch=('x86_64' 'i686')
url="https://github.com/ansemjo/tinyssh-convert"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('3634d678aeac0f5afebc85b99260ef5eb9f25084bc0c12022fa92784f240841672074ba15036c2b09915b8c47a9ef8386f588b06ef92851c50037f8a00b8b3a7')

build() {
	cd "$pkgname-$pkgver"
        ./build.sh
}

package() {
	cd "$pkgname-$pkgver"
        install -Dm 755 ${pkgname} $pkgdir/usr/bin/${pkgname}
}
