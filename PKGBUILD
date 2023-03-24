# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Dustin Childers <dchilders@gmail.com>

pkgname=berty-bin
_pkgname="${pkgname%-bin}"
pkgver=2.461.0
pkgrel=1
pkgdesc="A secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache' 'MIT')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
b2sums=('adb8ba6ae0f0c587a3200b27fd5644637b10f4fd0de7ba26c8eb2748a249e9a2abbba7e8700e740cb9610e12670234ace04bfb78a925c4a6444bc9d8db4b078e')

package() {
	mv "${srcdir}/berty_linux_amd64" "${srcdir}/${_pkgname}-${pkgver}"
	cd "${srcdir}/${_pkgname}-${pkgver}"
	install -Dm0644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0755 "$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
