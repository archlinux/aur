# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Dustin Childers <dchilders@gmail.com>

pkgname=berty-bin
_pkgname="${pkgname%-bin}"
pkgver=2.470.1
pkgrel=1
pkgdesc="A secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache' 'MIT')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
b2sums=('7d54e9d62846eac7c199e6d4fce0021bade257e56a34e22b27830e7f557b815198fc1eb7d5713c1085fe99e91fe21ed90e22d3de5fb602304d9d3ccdf66c7e25')

package() {
	mv "${srcdir}/berty_linux_amd64" "${srcdir}/${_pkgname}-${pkgver}"
	cd "${srcdir}/${_pkgname}-${pkgver}"
	install -Dm0644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0755 "$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
