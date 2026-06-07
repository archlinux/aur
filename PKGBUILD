# Maintainer: Sergei Sokolov <mohterbaord at gmail dot com>

pkgname=polybarman
pkgver=0.4.0
pkgrel=1
pkgdesc='Plugin manager for Polybar'
arch=( 'any' )
url="https://codeberg.org/mohterbaord/${pkgname}"
license=( 'MIT' )
depends=( 'coreutils' 'findutils' 'git' 'jq' 'sed' 'zsh' )
install=polybarman.install
source=( "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz" )
sha256sums=( 'b174c37d0077d807453ce37c6a07c252923d55019eaeaaf1d24fb91dba8e9f53' )

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm644 LICENSE                    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md                  -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm755 zsh/functions/polybarman   -t "${pkgdir}/usr/share/zsh/site-functions/"
  install -Dm644 zsh/functions/_polybarman  -t "${pkgdir}/usr/share/zsh/site-functions/"
}
