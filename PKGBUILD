# Maintainer: Mohamed Hussein Al-Adawy <59349012+moheladwy@users.noreply.github.com>
pkgname=archoxide-bin
pkgver=0.1.0
pkgrel=14
pkgdesc='Keyboard-driven terminal UI for Arch packages, Flatpaks, and AppImages (prebuilt)'
arch=('x86_64')
url='https://github.com/moheladwy/ArchOxide'
license=('MIT')
depends=('glibc' 'libgcc' 'pacman' 'sudo')
optdepends=(
    'curl: download AppImages over HTTPS'
    'flatpak: manage Flatpak apps'
    'fontconfig: discover installed font families'
    'glib2: open desktop applications with gio'
    'kitty: launch with the saved terminal font'
    'yay: search and manage AUR packages'
)
provides=("archoxide=$pkgver")
conflicts=('archoxide' 'archoxide-git')
options=('!strip' '!debug')
source=("$url/releases/download/$pkgname-$pkgver-$pkgrel/archoxide-$pkgver-$pkgrel-x86_64.tar.gz")
sha256sums=('bd9540ccfbcfab88a1d0fa6d022fc1c9a11470c44348b9639cd317ee861b0cfa')

package() {
    install -Dm755 "$srcdir/archoxide" "$pkgdir/usr/bin/archoxide"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
