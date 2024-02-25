# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=git-prompt.zsh
pkgname="${_name}"
pkgver=2.4.0
pkgrel=1
pkgdesc='A fast, pure-shell, single-file Git prompt for Zsh.'
arch=(any)
url="https://github.com/woefe/${_name}"
license=(MIT)
source=("https://github.com/woefe/git-prompt.zsh/archive/v${pkgver}.tar.gz")
depends=(git zsh)
conflicts=(git-prompt.zsh-git)
sha256sums=(675f942d315a7750e591ef8d084c227dcbd2052b6751e2858c1b6ecafd8fa8f7)

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -d "${pkgdir}/usr/share/zsh/scripts"
  install -m 0644 "${_name}" "${pkgdir}/usr/share/zsh/scripts/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/${pkgname}"
}
