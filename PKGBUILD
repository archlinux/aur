# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=screenshot-bash
pkgver=1.2.0
pkgrel=1
pkgdesc='Screenshot script, that uploads screenshot to a predefined server.'
arch=('any')

url='https://gitlab.com/Scrumplex/ScreenshotBASH'
license=('GPL3')

depends=('bash' 'flameshot' 'kdialog' 'sox')
makedepends=('git')
provides=('screenshot-bash' 'upload-bash')
conflicts=('screenshot-bash-git')

source=(
    "https://gitlab.com/Scrumplex/ScreenshotBASH/-/archive/${pkgver}/ScreenshotBASH-${pkgver}.tar.gz"
)
sha512sums=('be614b1fd867b715bc414b5949801c616b3b1bb0183950d871056ddcbfaa92309d658f6cfcb380d7aeacd8a6b52cb4e8ff1e1aada3b2809b6ff8e0763679f6e2')

package() {
    cd "ScreenshotBASH-${pkgver}"
    bash install.sh "$pkgdir/usr/bin"
    install -v -m644 -D "ScreenshotBASH.khotkeys" "$pkgdir/usr/share/khotkeys/ScreenshotBASH.khotkeys"
}
