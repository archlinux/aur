# Maintainer: aurrrrrr <no email>

_pkgname=gomuks-web
pkgname=${_pkgname}-bin
pkgver=0.2607.0
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
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

_bin_base_source="${url}/releases/download/v${pkgver}/gomuks"
source_x86_64=("gomuks.bin-x86_64::$_bin_base_source-amd64")
source_aarch64=("gomuks.bin-aarch64::$_bin_base_source-arm64")
source_armv7h=("gomuks.bin-armv7h::$_bin_base_source-arm")

sha256sums=('d0e0f7844e50f1c00c54583b4fc3cbce9b353d7a7029013882a9aef0e44bf23a')
sha256sums_x86_64=('0af5630adee18fc6d7b4adf918e76118606cc32a34b5d7fc39fd0a0146727ca6')
sha256sums_aarch64=('f72d4282d38c4d66c165571bf57d5f5b44f66dcebb633cfb8a6370d0c352bed5')
sha256sums_armv7h=('281030f8db76f7e5e0b43bd7187d0286df7ff8c8d392c97d0ac50fa55cae1b18')


package() {
	cd "$srcdir"

	install -Dm755 "gomuks.bin-$CARCH" "$pkgdir/usr/bin/${_pkgname}"

	cd "$srcdir/gomuks-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}" README.md CHANGELOG.md
	
}

