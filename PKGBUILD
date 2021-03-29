# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=screenshot-bash
pkgver=3.0.0
pkgrel=1
pkgdesc="Screenshot script, that uploads screenshot to a predefined server."
arch=("any")
url="https://gitlab.com/Scrumplex/ScreenshotBASH"
license=("GPL3")
depends=("bash" "kdialog" "sox")
optdepends=("spectacle: use default screenshot program"
            "flameshot: use alternative screenshot program")
provides=("screenshot-bash" "upload-bash")
conflicts=("screenshot-bash-git")

source=("https://gitlab.com/Scrumplex/ScreenshotBASH/-/archive/${pkgver}/ScreenshotBASH-${pkgver}.tar.gz")
sha512sums=('5b247b60742ac8add8ff37ae5d721ed19d2cf668a7ef718caf3308089982027c549d28e26108ae05c24f18e677869536ca2ca7e40b7e2863aaa806ca1d68a5c0')



package() {
    cd "ScreenshotBASH-${pkgver}"

    install -Dm755 "screenshotBASH" "$pkgdir/usr/bin/screenshotBASH"
    install -Dm755 "uploadBASH" "$pkgdir/usr/bin/uploadBASH"
    
    install -Dm644 "screenshotBASH.conf" "$pkgdir/usr/share/doc/${pkgname}/screenshotBASH.conf"
    install -Dm644 "ScreenshotBASH.khotkeys" "$pkgdir/usr/share/khotkeys/ScreenshotBASH.khotkeys"
}
