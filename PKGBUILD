# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=screenshot-bash
pkgver=4.1.0
pkgrel=2
pkgdesc="Screenshot script, that uploads screenshot to a predefined server."
arch=("any")
url="https://codeberg.org/Scrumplex/screenshot-bash"
license=("GPL3")
depends=("bash" "coreutils" "curl" "file" "gzip" "kdialog" "sox" "xdg-utils")
optdepends=("grim: use default screenshot program"
            "slurp: use default screenshot program"
            "wl-clipboard: use default clipboard tool"
            "spectacle: use alternative screenshot program"
            "flameshot: use alternative screenshot program"
            "xsel: use alternative clipboard tool")
provides=("upload-bash")
source=("https://codeberg.org/Scrumplex/screenshot-bash/archive/${pkgver}.tar.gz")
sha512sums=('98798065203c3936cc9f10baafbebc370264c5e34c16df31fb3dcab077296b3dea9572762cdda6aa98425a4796f3756aa72349e5d3289337e442965cac84adef')



package() {
    cd "screenshot-bash"

    install -Dm755 "screenshot-bash" "$pkgdir/usr/bin/screenshot-bash"
    install -Dm755 "upload-bash" "$pkgdir/usr/bin/upload-bash"
    
    install -Dm644 "screenshot-bash.conf" "$pkgdir/usr/share/doc/${pkgname}/screenshot-bash.conf"
    install -Dm644 "khotkeys/screenshot-bash.khotkeys" "$pkgdir/usr/share/khotkeys/Screenshot-bash.khotkeys"
    install -Dm644 "sway/config.d/screenshot-bash.conf" "$pkgdir/usr/share/doc/${pkgname}/sway.conf"
}
