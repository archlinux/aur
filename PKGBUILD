# Maintainer: witt <1989161762 at qq dot com>

pkgname=open
pkgver=0.0.3
pkgrel=1
url='https://github.com/witt-bit/pc-guide'
pkgdesc='Use the open command to open a folder in a GUI window'
arch=('any')
license=('Apache-2.0')
conflicts=('open' 'open-git' 'open-bin')
provides=('open' 'open-command')
options=('!strip')
source=(
    "open.sh::${url}/releases/download/v${pkgver}/open.sh"
    "license::${url}/raw/master/LICENSE"
)
sha256sums=('d9d0ae0225817945f4c8cf8a37741ce884226c6b8f66066a557f122c4d3c2305'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
    # source
    install -Dm755 "${srcdir}/open.sh" -t "${pkgdir}/usr/share/open/";
    # link
    install -d "${pkgdir}/usr/bin";
    ln -sf ../share/open/open.sh "${pkgdir}/usr/bin/open";

    # license
    install -Dm644 "license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
