# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
# https://github.com/harilvfs
pkgname=yt-x-git
_pkgname=yt-x
pkgver=v0.4.0.r47.g6169a48
pkgrel=1
pkgdesc="Browse youtube from your terminal"
arch=(any)
url="https://github.com/Benexl/$_pkgname"
license=('GPL')
options=(!strip)
depends=(
  'jq'
  'curl'
  'yt-dlp'
  'fzf'
  'mpv'
  'ffmpeg'
)
makedepends=(git)
optdepends=(
  'gum'
  'chafa'
  'icat'
  'imgcat'
)

source=("${pkgname}::git+https://github.com/Benexl/$_pkgname.git")
md5sums=('SKIP')

conflicts=($_pkgname)
provides=($_pkgname)

makedepends=('git')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {

  install -Dm 755 ${srcdir}/${pkgname}/${_pkgname} -t ${pkgdir}/usr/bin/

  install -Dm 644 ${srcdir}/${pkgname}/LICENSE -t ${pkgdir}/usr/share/licenses/${_pkgname}/

  install -Dm 644 ${srcdir}/${pkgname}/README.md -t ${pkgdir}/usr/share/doc/${_pkgname}/

}
