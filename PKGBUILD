# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Dustin Childers <dchilders@gmail.com>

pkgname=berty-bin
_pkgname="${pkgname%-bin}"
pkgver=2.470.10
pkgrel=1
pkgdesc="A secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache' 'MIT')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
b2sums=('7b34596b8d985ce3d7e68b7d160d8e30c8eb5f8b35b2d8962c9c9c792b26b1834e1a7fc7fe4ed8d9b148bcd12f40c7efd387cee2e9a89a936c81fb4b255b0588')

package() {
	mv "${srcdir}/berty_linux_amd64" "${srcdir}/${_pkgname}-${pkgver}"
	cd "${srcdir}/${_pkgname}-${pkgver}"
	install -Dm0644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0755 "$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
