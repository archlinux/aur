# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple, lightweight file manager for KDE (prebuilt binary)"
arch=('x86_64')
url="https://forgejo.voten.me/Voten641/minnow"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'shared-mime-info' 'hicolor-icon-theme')
optdepends=('breeze-icons: the icons Minnow is designed around'
            'udisks2: mounting removable drives and disk images'
            'polkit: Act as Administrator (admin:///)'
            'kdeconnect: Send To your phone and other devices'
            'bluedevil: Send To over Bluetooth'
            'xdg-utils: Send by Email'
            'smbclient: browsing smb:// (Windows/Samba) network folders'
            'ffmpegthumbnailer: video thumbnails'
            'git: version control status on icons'
            'avahi: finding servers for the Network place')
provides=('minnow')
conflicts=('minnow')
# grabs the tarball built by the Forgejo release-binary workflow (archlinux:latest container, so ABI matches)
source=("$pkgname-$pkgver.tar.gz::https://forgejo.voten.me/Voten641/minnow/releases/download/v$pkgver/minnow-v$pkgver-x86_64.tar.gz")
sha256sums=('316705f33e5b54663c6a7975bb2fa2122ff8a9e3454e51ece37617d63e02823a')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
