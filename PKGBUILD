PKGDEST="$HOME/.cache/pacman/pkg/$pkgname"

pkgname=e-z-recorder
pkgver=1.8.3
pkgrel=2
pkgdesc="E-Z Video Recording & Uploading on Linux. Install dependencies based on your session type (Wayland or X11)."
arch=('any')
url="https://github.com/verysillycat/e-z-recorder-linux"
license=('MIT')
source=("https://raw.githubusercontent.com/verysillycat/e-z-recorder-linux/main/e-z-recorder.sh")
sha256sums=('SKIP')
install=e-z-recorder.install

depends=('jq' 'ffmpeg')
optdepends=(
    'kooha: GNOME & KDE support'
    'wl-clipboard: Wayland Clipboard support'
    'slurp: Wayland wlroots based support'
    'wf-recorder: Wayland wlroots based support'
    'xclip: X11 Clipboard support'
    'slop: X11 Support'
)

package() {
    install -d -m755 "${PKGDEST}/usr/bin"
    echo "#!/bin/bash" > "${PKGDEST}/usr/bin/e-z-recorder"
    install -Dm755 "$srcdir/e-z-recorder.sh" "$pkgdir/usr/bin/e-z-recorder"
}
