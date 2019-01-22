# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=screenshot-bash
pkgver=1.1.0
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
sha512sums=('8b0760548719c4006e2a93ea807e8a7a421d74682d679312176f227f4f2b2a9a17a75a922bc45901f4ae533f1df683f0a4ff6100245cfdaae2b0bdc8dc3be348')

package() {
    cd "ScreenshotBASH-${pkgver}"
    bash install.sh "$pkgdir/usr/bin"
    install -v -m644 -D "ScreenshotBASH.khotkeys" "$pkgdir/usr/share/khotkeys/ScreenshotBASH.khotkeys"
}

