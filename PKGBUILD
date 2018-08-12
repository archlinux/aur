# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=screenshot-bash
pkgver=1.0.1
pkgrel=1
pkgdesc='Screenshot script, that uploads screenshot to a predefined server.'
arch=('i686' 'x86_64')

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
    "09489b886686906ee2f62e13c5a3022000dbd3701bb31472797bc48743e2879cdac70ad9241429c3261e3d43fb74da9971757a0f2f0a0d3ef51c11dfbde43d62"
)

package() {
    cd "ScreenshotBASH-${pkgver}"
    bash install.sh "$pkgdir/usr/bin"
    install -v -m644 -D "ScreenshotBASH.khotkeys" "$pkgdir/usr/share/khotkeys/ScreenshotBASH.khotkeys"
}

