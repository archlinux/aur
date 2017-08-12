# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="gws"
pkgver="0.1.14"
pkgrel="1"
pkgdesc="Colorful KISS helper for git workspaces"
url="https://github.com/StreakyCobra/gws"
license=('MIT')
arch=('any')
depends=('bash>4.0' 'git')
changelog="ChangeLog"
source=(
  "https://github.com/StreakyCobra/${pkgname}/archive/${pkgver}.tar.gz"
  "${pkgver}.tar.gz.sig"
)
validpgpkeys=('EB8627616EC1971DF076F2FF2BF5FD22FCABDE73')
sha256sums=('25d2756b67a316ed02b895a469a824269ccb715fd268b50c9937d8998f1b0836'
            'SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    install -D -m755 'src/gws' "${pkgdir}/usr/bin/${pkgname}"
    install -D -m755 'completions/zsh' "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -D -m755 'completions/bash' "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}

# vim:set ts=4 sw=4 et:
