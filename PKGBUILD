# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('i686' 'x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_i686=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_armv6.tar.gz")
sha256sums_i686=('f78dc373a30a75173d79edf363f5b490c205f64fe088acacd07040f3055b2807')
sha256sums_x86_64=('06a139771c5b4ee6092a720f367af29014de62f4d181b5d2a5b3f7fb7bacd3d1')
sha256sums_aarch64=('6c9b85c4cbadf1ff3cc5750f75c8f393dd1b16bf2c49af46d1e3ed3c22a92a3c')
sha256sums_armv6h=('3b78a40be0f767990e90b9d8612533c2f062548b9eff26790081ce1f46839a87')

package() {
	cd $(find . -name "wtf_$pkgver_*" -type d | sed 1q)
	install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
	install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
