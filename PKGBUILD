# Author: futpib <futpib@gmail.com>

pkgname=firefox-extension-open-url-in-container-cli-git
pkgver=2.0.0alpha10.r0.g4fa3765
pkgrel=1
pkgdesc='`firefox-container` script to open URLs in firefox containers from the command line.'
arch=('x86_64')
url='https://github.com/honsiorovskyi/open-url-in-container'
license=('GPL')
depends=()
makedepends=('git' 'nodejs' 'yarn')
optdepends=(
    'firefox: The browser to use this script and required extensions with'
    'firefox-extension-multi-account-containers: May be installed from Mozilla Add-ons Store'
    'firefox-extension-open-url-in-container: May be installed from Mozilla Add-ons Store'
)
provides=('firefox-extension-open-url-in-container-cli')
conflicts=('firefox-extension-open-url-in-container-cli')
source=("git+https://github.com/honsiorovskyi/open-url-in-container.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/open-url-in-container"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
    cd "${srcdir}/open-url-in-container"

    install -dm755 "$pkgdir/usr/bin"
    install -m755 \
            "$srcdir/open-url-in-container/bin/launcher.sh" \
            "$pkgdir/usr/bin/firefox-container"
}
