# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: MCMic <come@chilliet.eu>
pkgname=llanfair
pkgver=1.5.4
pkgrel=1
pkgdesc='Java speedrun/split timer (Gered’s fork)'
arch=(any)
url='https://github.com/gered/Llanfair'
license=(CCPL:by-nc-sa)
depends=('java-runtime>=7' 'sh' 'hicolor-icon-theme')
source=("$url/releases/download/$pkgver/llanfair-$pkgver.jar"
        "$pkgname.desktop"
        run.sh)
sha256sums=('03237ca9847750843946861a65aea0ef1965d64715b08000ae1c9ce09ce5b00c'
            '39acff31a4eab5021465f00186d3be9fd2a1b0a5c8dfca3813ea90cd75f4826f'
            '64100dc8d7bed9a8d513acf4446e23a5bbc32de9a6d5718793e65685b8d61aa9')

package() {
	install -Dm644 "llanfair-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/llanfair.jar"
	install -Dm755 run.sh "$pkgdir/usr/bin/llanfair"
	install -Dm644 img/Llanfair.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/llanfair.png"
	install -Dm644 -t "$pkgdir/usr/share/applications" "$pkgname.desktop"
}
