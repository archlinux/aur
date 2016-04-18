# Maintainer: Duy Truong <jimreynold2nd@yahoo.com>

pkgname=unlinkmkv-git
pkgver=r29.639bea0
pkgrel=1
pkgdesc="Merges ordered chapters / segmented MKVs back into a single file."
arch=('any')
url="https://github.com/gnoling/UnlinkMKV"
license=('GPL')
makedepends=('git')
depends=('perl' 'mkvtoolnix-cli' 'perl-xml-libxml' 'perl-log-log4perl' 'perl-string-crc32' 'perl-ipc-run3' 'perl-file-which' 'ffmpeg')
source=('git+https://github.com/gnoling/UnlinkMKV.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/UnlinkMKV"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/UnlinkMKV"
   mkdir -p $pkgdir/usr/bin
   install -m 0755 unlinkmkv $pkgdir/usr/bin/
}
