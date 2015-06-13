# Maintainer: Emil Lundberg <lundberg.emil@gmail.com> (AUR/GitHub: emlun)

_pkgname=passqr
pkgname="${_pkgname}-git"
pkgver=1.3.3.r0.ga037740
pkgrel=1
pkgdesc="Generate 2D barcodes from password-store entries"
arch=('any')
url='https://github.com/emlun/passqr'
license=('GPL')
backup=("etc/${_pkgname}.conf")
depends=('pass' 'qrencode')
optdepends=(
    'feh: fast image viewer'
    'gpicview: fast image viewer'
    'imagemagick: fast image viewer'
    'nomacs: fast image viewer'
    'qiv: fast image viewer'
    'xv: fast image viewer'
    'gimmage: image viewer'
    'mirage: image viewer'
    'ristretto: image viewer'
    'viewnior: image viewer'
    'fbida: console image viewer'
    'fbv: console image viewer'
    )
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}.git#branch=dev")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname}"
    make install DESTDIR="${pkgdir}"
}
