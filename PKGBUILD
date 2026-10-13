# Maintainer: Pivotd <support@penguin-mail.com>
# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=penguin-mail-bin
pkgver=1.0.8
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
sha256sums=('084301bf3cddc8f68df63cdff2d1478288d2c44b531aa4e2912c6080d1bcc702')

package() {
    # The download is already a pacman package tree; lift its files
    # straight into this one instead of rebuilding them. Its own
    # .PKGINFO, .BUILDINFO and .MTREE belong to that build, not this one.
    bsdtar -xf "penguin-mail-$pkgver-1-x86_64.pkg.tar.zst" -C "$pkgdir" \
        --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
