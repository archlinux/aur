# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=screenshot-bash
pkgver=1.0.2
pkgrel=1
pkgdesc='Screenshot script, that uploads screenshot to a predefined server.'
arch=('any')

url='https://gitlab.com/Scrumplex/ScreenshotBASH'
license=('GPL3')

depends=('bash' 'spectacle' 'kdialog' 'sox')
makedepends=('git')
provides=('screenshot-bash' 'upload-bash')
conflicts=('screenshot-bash-git')

source=(
    "https://gitlab.com/Scrumplex/ScreenshotBASH/-/archive/${pkgver}/ScreenshotBASH-${pkgver}.tar.gz"
)
sha512sums=(
    "2a59df1297dec549790438d6fa2cb909e57dbf5d525b8701ad138fa1b4a6fc91aedd2748cd8d01f0ba3d9fbc43e585fc10e0e36c84a8f5e22f743ecafe7eaa17"
)

package() {
    cd "ScreenshotBASH-${pkgver}"
    bash install.sh "$pkgdir/usr/bin"
    install -v -m644 -D "ScreenshotBASH.khotkeys" "$pkgdir/usr/share/khotkeys/ScreenshotBASH.khotkeys"
}

