# Maintainer: Gerard Ribugent <ribugent@gmail.com>
pkgname=jenv
pkgver=0.5.4
pkgrel=1
pkgdesc="Manage your Java environment"
arch=('any')
url="https://github.com/jenv/jenv"
license=('custom:MIT')
depends=('bash')
options=()
source=($pkgname-$pkgver.tar.gz::https://github.com/jenv/jenv/archive/refs/tags/0.5.4.tar.gz)
noextract=()
sha256sums=('15a78dab7310fb487d2c2cad7f69e05d5d797dc13f2d5c9e7d0bbec4ea3f2980')

build() {
	cd "$pkgname-$pkgver"
	rm -rf .github .gitgignore
}

package() {
	mkdir -p "$pkgdir"/{opt,usr/bin}
	cp -ra "$pkgname-$pkgver" "$pkgdir"/opt/jenv
	ln -s /opt/jenv/libexec/jenv "$pkgdir/usr/bin/jenv"
	install -Dm644 "$pkgname-$pkgver"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
