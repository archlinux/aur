# Maintainer: éclairevoyant
# Contributor: Sitansh Rajput <me [at] lostpolaris [dot] com>

_pkgname=navidrome
pkgname="$_pkgname-bin"
pkgver=0.49.3
pkgrel=1
pkgdesc='Music server and streamer compatible with Subsonic/Airsonic'
arch=(x86_64 armv6h armv7h aarch64)
url='https://www.navidrome.org'
license=(GPL3)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/navidrome/navidrome.toml')
depends=(ffmpeg glibc)
source=($pkgname.service
        $pkgname.toml)
source_x86_64=("https://github.com/navidrome/navidrome/releases/download/v$pkgver/navidrome_${pkgver}_Linux_x86_64.tar.gz")
source_armv6h=("https://github.com/navidrome/navidrome/releases/download/v$pkgver/navidrome_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/navidrome/navidrome/releases/download/v$pkgver/navidrome_${pkgver}_Linux_armv7.tar.gz")
source_aarch64=("https://github.com/navidrome/navidrome/releases/download/v$pkgver/navidrome_${pkgver}_Linux_arm64.tar.gz")

sha256sums=('c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
            'b0a0014e4db31a51db5b1144706f2d324da83f1b86074cfb8e19cdb767371a8f')
sha256sums_x86_64=('d7646878e34d7c79eab9345c8779637eeac9faf2147f6fda2f4b2d832a76308e')
sha256sums_armv6h=('d75e1aac7c35d8d15ee2dbeed49e80cf363a3ce54b4ab95cf3e7877884090a48')
sha256sums_armv7h=('c8298754e7abd0461ca014bb939e2f34af1fd88b34e8d8329c50af321b8a155d')
sha256sums_aarch64=('1c7b31be311d441261fe148e7c8bb81273ac7bf1024388304a8929457eab87a6')

package() {
	install -vDm755 $_pkgname -t "$pkgdir/usr/bin/"
	install -vDm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -vDm644 $pkgname.toml "$pkgdir/etc/$_pkgname/$_pkgname.toml"
}
