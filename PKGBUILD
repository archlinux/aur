# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.6.6
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://kewt.krzak.org"
license=('ISC')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::https://git.krzak.org/N0VA/kewt/releases/download/v${pkgver}/kewt")
sha256sums=('d9bf6bd6d7290e75dae2d7c08869549dda7c3e620e8ea1c8be94fa0d1487c954')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kewt" --dump-zsh-completions > "${pkgdir}/usr/share/zsh/site-functions/_kewt"
}
