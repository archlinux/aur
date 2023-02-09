# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Dustin Childers <dchilders@gmail.com>

pkgname=berty-bin
pkgver=2.453.1 # REMEMBER TO UPDATE CHANGELOG!
pkgrel=1
pkgdesc="A secure peer-to-peer messenger which works with or without internet access, cellular data or trust in the network and uses IPFS."
arch=('x86_64')
changelog=changelog
url="https://github.com/${pkgname::-4}/${pkgname::-4}"
license=('Apache' 'MIT')
depends=('glibc')
provides=('berty')
conflicts=('berty')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/berty_linux_amd64.tar.gz")
b2sums=('1e8bd07e55013c327a88838b7a6d57cae4b70f7b65d07fcba4c4d040fb05d70c7ce8f9036e0ff1e008df9d013184a5b46e956789bd17c593d61750b583672de2')

package() {
	install -Dm0644 "${srcdir}/berty_linux_amd64/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-APACHE"
	install -Dm0644 "${srcdir}/berty_linux_amd64/LICENSE-MIT" "${pkgdir}/usr/share/licenses/berty-bin/LICENSE-MIT"
	install -Dm0755 "${srcdir}/berty_linux_amd64/berty" "${pkgdir}/usr/bin/berty"
}
