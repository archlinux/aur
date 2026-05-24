# Maintainer: aurrrrrr <no email>

_pkgname=gomuks-web
pkgname=${_pkgname}-bin
pkgver=0.2605.0
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
source_x86_64=("gomuks.bin-x86_64::$_bin_base_source-amd64")
source_aarch64=("gomuks.bin-aarch64::$_bin_base_source-arm64")
source_armv7h=("gomuks.bin-armv7h::$_bin_base_source-arm")

b2sums=('c6eaeaa1f76b22cf63ae2ce976d55c4a432f4a8bef1472715527e340659a86a96302e45455a2f97f53410c62a01332c824b05b773b5521738b632f31e1261545')
b2sums_x86_64=('4db61f7c80f961ee213b389c251b30e1fe692ce0a29fad73cdee01304ce0fd09798f29b90cef313ac37c1ec604817650107a37129eaa64fb1c7706f1eaf853e8')
b2sums_aarch64=('d8ac56f0195bbf2ed464c54983d7f025f4db5eadcfde222883bd66f1bf0baa473b62bd0a1bd7b201d4a47df1d6d32a735f546a84ffc200b50de211c3ee8b8c08')
b2sums_armv7h=('20230e640421440acc17653e036b85a74dc3503b6c124f52b109103839f5013b674b7de6a0cb38355df9bbba90fd50a8ef96121e9b1152322e22c3acb3e11b9f')


package() {
	cd "$srcdir"

	install -Dm755 "gomuks.bin-$CARCH" "$pkgdir/usr/bin/${_pkgname}"

	cd "$srcdir/gomuks-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}" README.md CHANGELOG.md
	
}

