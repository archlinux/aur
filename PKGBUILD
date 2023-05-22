# Maintainer: meanlint <meanlint@outlook.com>
# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=yacd-meta-ghp-bin
_pkgname=Yacd-meta
pkgver=20230520.1
pkgrel=1

pkgdesc='Yet Another Clash Dashboard (prebuild gh-pages)'
arch=('any')
_repo="MetaCubeX/${_pkgname}"
url="https://github.com/${_repo}"
license=('MIT')

makedepends=('git')
optdepends=('clash: A rule-based tunnel in Go'
            'sing-box: The universal proxy platform'
            'clash-meta: Another Clash Kernel by MetaCubeX')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}::git+${url}.git#branch=gh-pages")
sha256sums=('SKIP')

package() {
  cd "$_pkgname"

  find . -type f -not -path '*/\.git/*' -exec install -Dm 644 {} "${pkgdir}"/usr/share/"${_pkgname}"/{} \;
}
