# AUR packager: Élie Leblanc <leblancelie dot moi at gmail dot com>
# Contributor and author of madbfs: Muhammad Rizal Nurromdhoni <mrizaln2000 at gmail dot com>
pkgname=madbfs-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Mount Android phones on Linux with adb (userspace filesystem for Android via adb using FUSE)"
arch=(x86_64)
url="https://github.com/mrizaln/madbfs"
license=('MIT')
depends=(android-tools)
makedepends=(chrpath)
provides=(madbfs)
conflicts=(madbfs)
source=("$url/releases/download/v$pkgver/madbfs.tar.gz"
"https://raw.githubusercontent.com/mrizaln/madbfs/refs/heads/main/README.md"
"https://raw.githubusercontent.com/mrizaln/madbfs/refs/heads/main/LICENSE")
sha256sums=('6bb7acce00e84c47f64e45dfa206b7fa738f7d94c78b805edfbbfc90f5acb777'
                        '1a2af9b2ed3c02534b3ea9f71e0081725bc266a44257b43b7097f5573ceab764'
                        'd68068da79f0c8225b909483230ec9b5bf79b50cef70fc5720509d60ec9d3cc1')

package(){
	chrpath -d "${srcdir}/madbfs/madbfs"
	install -Dm755 "${srcdir}/madbfs/madbfs" "${pkgdir}/usr/bin/madbfs-bin"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/madbfs/MIT.txt"
	install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/madbfs/README.md"
}
