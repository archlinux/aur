# Maintainer: KAAAsS <admin@kaaass.net>
pkgname=ipt2socks
pkgver=1.1.3
pkgrel=1
pkgdesc="utility for converting iptables(redirect/tproxy) to socks5"
arch=(x86_64)
url=https://github.com/zfl9/ipt2socks
license=(AGPL3)
source=(
    $pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
    ipt2socks.service
    ipt2socks@.service
    ipt2socks.conf
)
backup=(etc/ipt2socks/ipt2socks.conf)
sha512sums=(
    fd856cac0f6382d078144bbe209763fce7e5bd649c8adcc701671898d58d25394df0479713d575e91411f43ca7c42297dc1b3ff2781cfc83c05b0b6bbe59e566
    f307933e488e4368f9b670bdbb20d1dc34ac11a98ea77672dbb0957712241159f7e6dd77b9f0d42a5cf1c1e0f9815ece10904cfeff55c297be236ece845d8b47
    7333e497244c554d8f1e8077ba3238f421df58b4dec1ab3d01e81d05cfa6902add0b322246836dcae4a861c2588f28ff50d146f1eaf3cf449a2cd68c0fbd47a3
    54bdf9ac9fd4243d5105bcd4c2631dfd1622dc0a2939a5f1df435f5aabe67446ae24f6eecad06cb2094dd494edf1807448f737b587dc522bdefc05821cdc6025
)

build() {
    cd $pkgname-$pkgver
    make
}
package() {
	install -Dm755 $pkgname-$pkgver/ipt2socks "$pkgdir/usr/bin/ipt2socks"
	install -Dm644 ipt2socks.service "$pkgdir/usr/lib/systemd/system/ipt2socks.service"
	install -Dm644 ipt2socks@.service "$pkgdir/usr/lib/systemd/system/ipt2socks@.service"
	install -Dm644 ipt2socks.conf "$pkgdir/etc/ipt2socks/ipt2socks.conf"
} 
