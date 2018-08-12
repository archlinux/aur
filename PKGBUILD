# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=screenshot-bash
pkgver=1.0
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
    "c289879a93602429aca4c8bfa84883d4347a8c0c6d1d8b68743d38496af3c78c2ed1d267579642c7cd631676b86eff525dced2eb42491636f2f5ebdd42efa710"
)

package() {
    cd "ScreenshotBASH-${pkgver}"
    bash install.sh "$pkgdir/usr/bin"
    install -v -m644 -D "ScreenshotBASH.khotkeys" "$pkgdir/usr/share/khotkeys/ScreenshotBASH.khotkeys"
}

