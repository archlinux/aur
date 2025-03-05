# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>

_app_name=rakubrew
pkgname="${_app_name}-bin"
pkgver=43
pkgrel=1
pkgdesc="A Raku installation tool. It allows to have multiple versions of different Raku implementations installed in parallel and switch between them."
arch=('x86_64')
url='https://rakubrew.org/'
license=('MIT')
provides=('rakubrew')
conflicts=('rakubrew')
options=('!strip')
depends=('perl')
source=("${pkgname}-${pkgver}::https://${_app_name}.org/files/${pkgver}/perl/${_app_name}"
        "LICENSE")
sha256sums=('cf2003834ffeb92b88b61f26108892cc909781e6e072ae1b82bddd7490c65acd'
            '0bc1b636841114f78c1dbbb2e4c63916dc87c3d085d940866c7f33115b7156a9')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_app_name}"

    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_app_name}"
}
