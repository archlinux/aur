# Maintainer: AlphaJack <alphajack at tuta dot io>

# https://git.alpinelinux.org/aports/tree/community/ossec-hids

pkgname="ossec-hids"
pkgver=3.7.0
pkgrel=1
pkgdesc="Open Source Host-based Intrusion Detection System - Meta"
url="https://www.ossec.net/"
license=("GPL2")
arch=("x86_64" "aarch64" "armv7h")
optdepends=("ossec-hids-agent"
            "ossec-hids-local"
            "ossec-hids-server")
source=("https://github.com/ossec/ossec-hids/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('23f5ede50f5de449db0a571fc453977f7079b4b47ce90b0ef31feed20df100e9')
backup=("etc/ossec.conf")
options=("!strip")

package(){
 cd "$pkgname-$pkgver"
 # configuration
 install -D -m 644 -D "etc/ossec.conf" -t "$pkgdir/etc"
 # contributions
 install -d "$pkgdir/usr/share/ossec-hids"
 cp -a "contrib/"* "$pkgdir/usr/share/ossec-hids"
 rm -r "$pkgdir/usr/share/ossec-hids/"{selinux,debian-packages,specs}
 # documentation
 install -d "$pkgdir/usr/share/doc/ossec-hids"
 cp -a "doc/"* "$pkgdir/usr/share/doc/ossec-hids"
}
