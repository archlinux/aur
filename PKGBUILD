# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com

pkgname=nodejs-tldr-git
pkgver=r2111.fb501075
pkgrel=1
pkgdesc="Simplified and community-driven man pages (git version)"
arch=('any')
url="https://github.com/tldr-pages/tldr"
license=('MIT')
makedepends=('git')
depends=('nodejs' 'npm')
conflicts=('nodejs-tldr')
install='INSTALL'
source=("tldr::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd tldr
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p ${_npmdir}
    cd ${_npmdir}
    npm install -g --prefix "${pkgdir}/usr" tldr
}
