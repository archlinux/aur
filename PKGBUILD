# Maintainer: Randy Ramos <rramos1295@gmail.com>
# Contributors: Det, Achilleas Pipinellis, speed145a, Schnouki

_srcname=ungoogled-chromium

pkgname=ungoogled-chromium-bin
pkgver=55.0.2883.75
pkgrel=3
pkgdesc="Modifications to Google Chromium for removing Google integration and enhancing privacy, control, and transparency"
arch=('x86_64')
url="https://github.com/Eloston/ungoogled-chromium"
license=('BSD')
depends=('p7zip' 'firejail')
optdepends=('ffmpeg: H264/AAC/MP3 decoding')
provides=("ungoogled-chromium")
source=($pkgname::"https://github.com/Eloston/ungoogled-chromium/releases/download/$pkgver-1/ungoogled-chromium_55.0.2883-75-1_linux_x64_9Morello.tar.xz"
        'ungoogled.desktop' 'uchromium.sh')
sha256sums=('93448949d64b7c08ee4fa2026ca82e68ab47a32d1f2442bb116e53427859ebe2'
            'ddb7b46bd8d986dd832f8b71dd835396f00a4abf84747c5044c20224c9b95343'
			'f78cfa06c0d3fffdb1a8c9a373abb5babc9e8aca79f053ab4c7fd13146ae9acd')
package() {
  #cp -r ungoogled-chromium_$pkgver-1/ "$pkgdir"/opt/$pkgname
  install -d "$pkgdir/usr/lib/$_srcname"
  cp -ar "$_srcname"_"$pkgver-1"/* "$pkgdir/usr/lib/$_srcname"

  #ln -s /opt/ungoogled-chromium-bin/chrome "$pkgdir"/usr/bin/uchromium
  install -Dm755 "$srcdir"/uchromium.sh "$pkgdir"/usr/bin/uchromium
  install -Dm755 "$srcdir"/ungoogled.desktop "$pkgdir"/usr/share/applications/ungoogled.desktop
}
