# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="gws"
pkgver="0.2.0"
pkgrel="2"
pkgdesc="Colorful KISS helper for git workspaces"
url="https://github.com/StreakyCobra/gws"
license=('MIT')
arch=('any')
depends=('bash>4.0' 'git')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/StreakyCobra/${pkgname}/archive/${pkgver}.tar.gz"
  "https://github.com/StreakyCobra/${pkgname}/releases/download/${pkgver}/gws-${pkgver}.tar.gz.sig"
)
validpgpkeys=('EB8627616EC1971DF076F2FF2BF5FD22FCABDE73')
sha256sums=('f92b7693179c2522c57edd578abdb90b08f6e2075ed27abd4af56c1283deab1a'
            'SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    install -D -m755 'src/gws' "${pkgdir}/usr/bin/${pkgname}"
    install -D -m755 'completions/zsh' "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -D -m755 'completions/bash' "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}

# vim:set ts=4 sw=4 et:
