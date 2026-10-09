# Maintainer: Pivotd <support@penguin-mail.com>
# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=penguin-mail-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Mail and calendar for Linux (prebuilt binaries from the GitHub release)"
arch=('x86_64')
url="https://github.com/c9dev/penguin-mail"
license=('GPL-3.0-or-later')
provides=('penguin-mail')
conflicts=('penguin-mail')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'gnupg' 'hicolor-icon-theme')
optdepends=('gnome-shell-extension-appindicator: tray icon on GNOME Shell'
            'bubblewrap: run assistant skill scripts')
options=('!debug')

source=("penguin-mail-$pkgver-1-x86_64.pkg.tar.zst::https://github.com/c9dev/penguin-mail/releases/download/v$pkgver/penguin-mail-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('942e69de410545536e5108de22ad3ae34f076ab38a0a03fa163f91f018c532b9')

package() {
    # The download is already a pacman package tree; lift its files
    # straight into this one instead of rebuilding them. Its own
    # .PKGINFO, .BUILDINFO and .MTREE belong to that build, not this one.
    bsdtar -xf "penguin-mail-$pkgver-1-x86_64.pkg.tar.zst" -C "$pkgdir" \
        --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
