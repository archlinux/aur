# Maintainer: aurrrrrr <no email>

_pkgname=gomuks-web
pkgname=${_pkgname}-bin
pkgver=0.2604.0
pkgrel=1
pkgdesc="A Matrix client written in Go using mautrix-go. Web Frontend."
arch=(x86_64 aarch64 armv7h)
url="https://github.com/gomuks/gomuks"
license=('AGPL-3.0-only')
groups=()
depends=()
makedepends=() 
provides=("gomuks-web")
conflicts=("gomuks-web")
replaces=()
backup=()
options=(!debug)
source=("gomuks-source::${url}/archive/refs/tags/v${pkgver}.tar.gz")

_bin_base_source="${url}/releases/download/v${pkgver}/gomuks"
source_x86_64=(gomuks.bin::"$_bin_base_source-amd64")
#source_aarch64=(gomuks.bin::"$_bin_base_source-arm64")
#source_armv7h=(gomuks.bin::"$_bin_base_source-arm")

b2sums=('3b0f2efd05d2aac40d1185e218e9160fb5971c5c4973d5c023cb461886e853f40e311362b18296e69594fe9b8b40b2c5e7322591cbd138acd8e75b413fe2b984')
b2sums_x86_64=('e4b3fc71973c9c4a67247fb60d570929c6fe25f34e94443464543398a1fca81d05361804b7743913b62952d5e7bb91cc8230f8c9bc806cdb88c6b80968e8d329')
#b2sums_aarch64=('AAAA')
#b2sums_armv7h=('AAAA')


package() {
	cd "$srcdir"

	install -Dm755 gomuks.bin "$pkgdir/usr/bin/${_pkgname}"

	cd "$srcdir/gomuks-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}" README.md CHANGELOG.md
	
}

