# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Dustin Childers <dchilders@gmail.com>

pkgname=berty-bin
_pkgname="${pkgname%-bin}"
pkgver=2.470.2
pkgrel=1
pkgdesc="A secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache' 'MIT')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
b2sums=('2df6fb8b638c6003fe3608e97cf02c333ae89ebc54f2181e4898f6135e6cdf004c3e983cee5c45be76a7b61ed2287736024d34f1fbfe04b6cf642d60b6b4334f')

package() {
	mv "${srcdir}/berty_linux_amd64" "${srcdir}/${_pkgname}-${pkgver}"
	cd "${srcdir}/${_pkgname}-${pkgver}"
	install -Dm0644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0755 "$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
