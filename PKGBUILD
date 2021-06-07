# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2-bin
pkgver=1.6.7
pkgrel=1
pkgdesc="Cross-platform command-line tool for batch renaming files and directories quickly and safely"
arch=(x86_64 i686 aarch64)
url="https://github.com/ayoisaiah/${pkgname%-bin}"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

b2sums_x86_64=('0d63c48ce581841a9cf9295d4d1b5914ed0fe8e494312cc7cd5cae48065e0eef1e5f9ae67e0bea06d1c64a5ba42e8198cfbf6eeacfab9c078663093514d76885')
b2sums_i686=('a58c45ada9dbb703b8a2a626fcf5d28bf53feebdb3e69e6ed8e4ef03b35f9d7392bef7ac4d9ee3a0adee0ff50b6a21847d468bf25b0f86254a066b1230dec357')
b2sums_aarch64=('c3ff0a004368c525a3517f1d0bca4051680f6903683335b58986aa692d70b303b038c4bb9c2619ce1557a3d287fc24ed964e599996c4c9f90721c51ddbd22855')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENCE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
