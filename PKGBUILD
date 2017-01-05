# Maintainer: Det <nimetonmaili g-mail>
# Contributors: Achilleas Pipinellis, speed145a, Schnouki

pkgname=ungoogled-chromium-bin
pkgver=55.0.2883.75
pkgrel=1
pkgdesc="Modifications to Google Chromium for removing Google integration and enhancing privacy, control, and transparency"
arch=('x86_64')
url="https://github.com/Eloston/ungoogled-chromium"
license=('BSD')
depends=('p7zip' 'bash' 'firejail')
optdepends=('ffmpeg: H264/AAC/MP3 decoding')
provides=("ungoogled-chromium")
source=("https://github.com/Eloston/ungoogled-chromium/releases/download/$pkgver-1/ungoogled-chromium_55.0.2883-75-1_linux_x64_9Morello.tar.xz"
        "ungoogled.desktop")
sha256sums=('93448949d64b7c08ee4fa2026ca82e68ab47a32d1f2442bb116e53427859ebe2'
            'e96e286ad49824b23d5bcaaf0c5005fcdd700548f13784491a4708a44405128b')
sha384sums=('098608fa011e29d658748d5bb3e4c630493847181d753bb7ce9ea3bdc2a80df1044e3698ef6da6d8f6325a885dd310c2'
            'fb829a24d24076cbfd25ea58280cc116aa979cfe8b146aa53e2178fbc1cb7950e877928a44f85ba60630f8171d0f6924')
sha512sums=('941dcc92665352ac9694a9658e308b8637f7f551093b13e79a272ba1ab2a7e821f7be8e87d36abcbd873f3dcf2d647383303b3b88d7ccc4020612854181b4f98'
            'c49022d0cc306dd3cd1118ae568e0b8bc54ae56eb1ca5aade0ebdfa65c8c32a2ed0519fb56ff7d0c68b15cfebe0a72bef376ec7c001a7ecff120a08d958812fa')
package() {
  # Create directories
  msg2 "Creating directory structure..."
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install

  cp -r ungoogled-chromium_$pkgver-1/ "$pkgdir"/opt/$pkgname

  # /usr/bin symlinks
  ln -s "$pkgdir"/opt/ungoogled-chromium/chrome "$pkgdir"/usr/bin/uchromium
    cp -r "$srcdir"/ungoogled.desktop "$pkgdir"/usr/share/applications
}
