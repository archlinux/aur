# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="intel-npu-top-git"
pkgver=r23.b1328af
pkgrel=2
pkgdesc="A simplified, text-only proof-of-concept for monitoring Intel Meteor Lake NPU usage in real-time via sysfs on Linux"
url="https://github.com/DMontgomery40/intel-npu-top"
license=("MIT")
arch=("x86_64" "aarch64")
depends=("python")
source=("git+$url")
b2sums=('SKIP')

pkgver(){
 cd "${pkgname/-git/}"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package(){
 cd "${pkgname/-git/}"
 install -D -m 755 "STANDALONE.py" "$pkgdir/usr/bin/intel_npu_top"
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname/-git/}/LICENSE"
}
