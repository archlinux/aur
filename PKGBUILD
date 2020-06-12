# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=screenshot-bash
pkgver=2.0.0
pkgrel=1
pkgdesc="Screenshot script, that uploads screenshot to a predefined server."
arch=("any")
url="https://gitlab.com/Scrumplex/ScreenshotBASH"
license=("GPL3")

depends=("bash" "flameshot" "kdialog" "sox")
makedepends=("git")

provides=("screenshot-bash" "upload-bash")
conflicts=("screenshot-bash-git")

source=("https://gitlab.com/Scrumplex/ScreenshotBASH/-/archive/${pkgver}/ScreenshotBASH-${pkgver}.tar.gz")
sha512sums=('df2577e85be81e4fa7797cbf1fc4d7ddc4a1c9544b8d1ff7969234e3943a5526877470f82e58e88dcd00d1fd621377eaaba42d11d9fde4f641303cb8eaac1484')



package() {
    cd "ScreenshotBASH-${pkgver}"

    install -Dm755 "screenshotBASH" "$pkgdir/usr/bin/screenshotBASH"
    install -Dm755 "uploadBASH" "$pkgdir/usr/bin/uploadBASH"
    
    install -Dm644 "screenshotBASH.conf" "$pkgdir/usr/share/doc/${pkgname}/screenshotBASH.conf"
    install -Dm644 "ScreenshotBASH.khotkeys" "$pkgdir/usr/share/khotkeys/ScreenshotBASH.khotkeys"
}
