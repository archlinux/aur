# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=jigdo-bin
pkgver=0.8.2
pkgrel=1
_pkgrel=1
_snapshot=20230804T205645Z
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
sha256sums_x86_64=('0fa3be8b97e67f240d9e004dc5fc85da80dc8a954cce42804d1cccd56aec7301')
sha256sums_i686=('ae8e72d1447d4c7bd73ca16c3ce725b1d5d5fac6e00216014adc5e57ad112daa')
sha256sums_armv7h=('3dd1e623ebb14669bb3476230fece0d04e5f530f952a8bfa31df1d18c3ea3e88')
sha256sums_aarch64=('21b639bce1b8587535cad72b06ba4f529dafcc7d80d30d719ed2f1d7cae90ad0')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir"/usr/share/doc
	rm -rf "$pkgdir"/usr/share/doc-base
}
