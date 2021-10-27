# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=screenshot-bash
pkgver=4.1.0
pkgrel=1
pkgdesc="Screenshot script, that uploads screenshot to a predefined server."
arch=("any")
url="https://gitlab.com/Scrumplex/screenshot-bash"
license=("GPL3")
depends=("bash" "coreutils" "curl" "file" "gzip" "kdialog" "sox" "xdg-utils")
optdepends=("grim: use default screenshot program"
            "slurp: use default screenshot program"
            "wl-clipboard: use default clipboard tool"
            "spectacle: use alternative screenshot program"
            "flameshot: use alternative screenshot program"
            "xsel: use alternative clipboard tool")
provides=("upload-bash")
source=("https://gitlab.com/Scrumplex/screenshot-bash/-/archive/${pkgver}/screenshot-bash-${pkgver}.tar.gz")
sha512sums=('d2485fea6cdc40687d67560b7f646dc51709435b025ee0dbf550e1f992d16dc49fed9f9e62b7325efc203177ef6beb13ad9277ab9aa56e1bb1b9128d8dc64c89')



package() {
    cd "screenshot-bash-${pkgver}"

    install -Dm755 "screenshot-bash" "$pkgdir/usr/bin/screenshot-bash"
    install -Dm755 "upload-bash" "$pkgdir/usr/bin/upload-bash"
    
    install -Dm644 "screenshot-bash.conf" "$pkgdir/usr/share/doc/${pkgname}/screenshot-bash.conf"
    install -Dm644 "khotkeys/screenshot-bash.khotkeys" "$pkgdir/usr/share/khotkeys/Screenshot-bash.khotkeys"
    install -Dm644 "sway/config.d/screenshot-bash.conf" "$pkgdir/usr/share/doc/${pkgname}/sway.conf"
}
