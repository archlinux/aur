# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=screenshot-bash
pkgver=4.0.1
pkgrel=1
pkgdesc="Screenshot script, that uploads screenshot to a predefined server."
arch=("any")
url="https://gitlab.com/Scrumplex/screenshot-bash"
license=("GPL3")
depends=("bash" "coreutils" "curl" "file" "gzip" "kdialog" "sox" "xdg-utils")
optdepends=("spectacle: use default screenshot program"
            "flameshot: use alternative screenshot program"
            "wl-clipboard: use default clipboard tool"
            "xsel: use alternative clipboard tool")
provides=("upload-bash")
source=("https://gitlab.com/Scrumplex/screenshot-bash/-/archive/${pkgver}/screenshot-bash-${pkgver}.tar.gz")
sha512sums=('4fd9bd8c26512f46920d833410e4065951134dabe7abbe170375f63098ebf7c3dc5d221c65796f9f222d10a1f166d54fdd882a4b37dc59522fec930ed63e0f73')



package() {
    cd "screenshot-bash-${pkgver}"

    install -Dm755 "screenshot-bash" "$pkgdir/usr/bin/screenshot-bash"
    install -Dm755 "upload-bash" "$pkgdir/usr/bin/upload-bash"
    
    install -Dm644 "screenshot-bash.conf" "$pkgdir/usr/share/doc/${pkgname}/screenshot-bash.conf"
    install -Dm644 "screenshot-bash.khotkeys" "$pkgdir/usr/share/khotkeys/Screenshot-bash.khotkeys"
}
