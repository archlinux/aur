# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=jigdo-bin
pkgver=0.8.2
pkgrel=2
_pkgrel=1.2
_snapshot=20250917T143544Z
pkgdesc="Distribute large images by sending and receiving the files that make them up - Debian package"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://www.einval.com/~steve/software/jigdo/"
license=('GPL2')
depends=('db' 'wget')
conflicts=('jigdo')
provides=('jigdo')

source_x86_64=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/j/jigdo/jigdo-file_${pkgver}-${_pkgrel}_amd64.deb")
source_i686=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/j/jigdo/jigdo-file_${pkgver}-${_pkgrel}_i386.deb")
source_armv7h=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/j/jigdo/jigdo-file_${pkgver}-${_pkgrel}_armhf.deb")
source_aarch64=("https://snapshot.debian.org/archive/debian/${_snapshot}/pool/main/j/jigdo/jigdo-file_${pkgver}-${_pkgrel}_arm64.deb")
sha256sums_x86_64=('9c0901d754794cf38f721e7e3cc07691f33acac1ee08a92705f24c978424bbde')
sha256sums_i686=('52deaac5f85915665a92d29e90954316b6224537ac735b0ea3bb756cc630375a')
sha256sums_armv7h=('2579ddb171d2c32cd69279e9eecade2c8b15cbd23036e26673d11e6bca2c80e9')
sha256sums_aarch64=('ab79e3568c2a19c269c88b5930fee1393304f7bb6360f368484bc1c1f13fa9f2')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir"/usr/share/doc
	rm -rf "$pkgdir"/usr/share/doc-base
}
