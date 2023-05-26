pkgname="wf-shadow-git"
pkgver="0.0.0"
pkgrel="1"
pkgdesc="Script to make instant-replay easy on wl-roots based compositors, git version"
arch=("x86_64" "arm")
depends=("wofi" "wf-recorder" "bash")
license=("GPL3+")
source=("https://codeberg.org/cobra/wf-shadow/raw/branch/main/wf-shadow" "https://codeberg.org/cobra/wf-shadow/raw/branch/main/doc/wf-shadow.1" "https://codeberg.org/cobra/wf-shadow/raw/branch/main/wf-shadow-tui" "https://codeberg.org/cobra/wf-shadow/raw/branch/main/doc/wf-shadow-tui.1")
sha512sums=("SKIP" "SKIP" "SKIP" "SKIP")
package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/wf-shadow" "${pkgdir}/usr/bin/wf-shadow"
    cp "${srcdir}/wf-shadow-tui" "${pkgdir}/usr/bin/wf-shadow-tui"
    chmod +x "${pkgdir}/usr/bin/wf-shadow"
    chmod +x "${pkgdir}/usr/bin/wf-shadow-tui"

    install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    install -Dm644 "${pkgname}-tui.1" "${pkgdir}/usr/share/man/man1/${pkgname}-tui.1.gz"
}
