# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=screenshot-bash
pkgver=4.0.0
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
sha512sums=('e9a5579b189b44e1b61a4c5025db26f909507aea8a15c7e3291e613ac2c6818fc7ca29e1c5f0738c8d80a7d7ee73a463d457f60afbe8829addc868e7db1276b9')



package() {
    cd "screenshot-bash-${pkgver}"

    install -Dm755 "screenshot-bash" "$pkgdir/usr/bin/screenshot-bash"
    install -Dm755 "upload-bash" "$pkgdir/usr/bin/upload-bash"
    
    install -Dm644 "screenshot-bash.conf" "$pkgdir/usr/share/doc/${pkgname}/screenshot-bash.conf"
    install -Dm644 "screenshot-bash.khotkeys" "$pkgdir/usr/share/khotkeys/Screenshot-bash.khotkeys"
}
