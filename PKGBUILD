# Maintainer: Daniel Seichter <https://github.com/dseichter>
pkgname=workdir-bin
pkgver=2026.03.21
pkgrel=1
pkgdesc="Work with multiple directories and run commands without navigating manually (prebuilt binary)."
arch=('x86_64')
url="https://github.com/dseichter/Workdir"
license=('GPL-3.0-only')
options=('!debug')
depends=('glibc')
source=(
    "workdir::https://github.com/dseichter/Workdir/releases/download/v${pkgver//./-}/workdir-archlinux-x86_64-v${pkgver//./-}"
    "io.github.dseichter.workdir.desktop::https://raw.githubusercontent.com/dseichter/Workdir/v${pkgver//./-}/data/io.github.dseichter.workdir.desktop"
    "io.github.dseichter.workdir.png::https://raw.githubusercontent.com/dseichter/Workdir/v${pkgver//./-}/data/io.github.dseichter.workdir.png"
)

# sha256sums is replaced by the CI workflow on each release.
sha256sums=('3c9ba6bb4dc65e423726e36ddc70ffb33b3a287f64cbc5d3b74de4e614c84583' 'SKIP' 'SKIP')

package() {
    install -Dm755 "workdir" "$pkgdir/usr/bin/workdir"
    install -Dm644 "io.github.dseichter.workdir.desktop" "$pkgdir/usr/share/applications/io.github.dseichter.workdir.desktop"
    install -Dm644 "io.github.dseichter.workdir.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/io.github.dseichter.workdir.png"
    install -Dm644 "io.github.dseichter.workdir.png" "$pkgdir/usr/share/pixmaps/io.github.dseichter.workdir.png"
}
