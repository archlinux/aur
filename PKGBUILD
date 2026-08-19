# Maintainer: Macmod <zz.mcmd at gmail dot com>
pkgname=ldapx-bin
_pkgname="${pkgname%-bin}"
pkgver=v1.3.3
pkgrel=1
pkgdesc="Flexible LDAP proxy for inspecting and transforming LDAP traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/Macmod/ldapx"
license=('MIT')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-amd64.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('eeaf5e4f6632da8aa758b6fc9fe7dc19eb99ba7209b3e52cfd62a942e29f98b4')
sha256sums_aarch64=('f47420f1a82a134e3a193c8586df6fde361f780de36519336a87fbd0e78802e2')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
