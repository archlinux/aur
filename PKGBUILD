# Maintainer: Alexander Kauer <alexander at affine dot space>

pkgname=run_scaled-git
_gitdir=run_scaled
pkgver=r5.0e9a656
pkgrel=1
pkgdesc='Run an X application scaled via xpra. Useful on hidpi screens'
arch=('any')
url='https://github.com/kaueraal/run_scaled.git'
license=('BSD')
depends=('xpra-winswitch' 'xorg-xrandr')
source=("${_gitdir}::git://github.com/kaueraal/run_scaled.git")
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_gitdir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitdir}"

  install -Dm755 run_scaled "${pkgdir}/usr/bin/run_scaled"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2 sw=2 et
