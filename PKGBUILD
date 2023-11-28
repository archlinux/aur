# Maintainer: Hayate Naka-mura <hayatehay.njb at gmail dot com>

_gitname='dnfpac'
pkgname="dnfpac"
pkgdesc="a pacman wrapper with syntax from fedora's dnf"
pkgver="0.1.1"
pkgrel="1"

arch=('any')
url="https://github.com/njb-fm/dnfpac"
license=('WTFPL')
depends=('bash')
conflicts=('dnf' 'yum')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('18d9ca62c740c27239a73bc0dbe96178')

package() {
    cd "${_gitname}-${pkgver}"
    install -m 755 -D dnfpac "${pkgdir}/usr/bin/dnfpac"
    install -m 755 -D LICENSE "${pkgdir}/usr/share/licenses/dnfpac/LICENSE"
    cd "${pkgdir}/usr/bin/"
    ln -s "dnfpac" "dnf"
    ln -s "dnfpac" "yum"
}
