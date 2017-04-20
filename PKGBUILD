# Maintainer: Randy Ramos <rramos1295@gmail.com>
# Contributors: Det, Achilleas Pipinellis, speed145a, Schnouki

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
			'f89b39b71556ff5c58dc829111bc959b44303e599d7e2253423e1ce5f561d56a')
package() {
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  cp -r ungoogled-chromium_$pkgver-1/ "$pkgdir"/opt/$pkgname

  ln -s /opt/ungoogled-chromium-bin/chrome "$pkgdir"/usr/bin/uchromium
  install -m755 "$srcdir"/uchromium.sh "$pkgdir"/usr/bin/uchromium
  install -m755 "$srcdir"/ungoogled.desktop "$pkgdir"/usr/share/applications
}
