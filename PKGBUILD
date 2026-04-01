# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://kewt.krzak.org"
license=('ISC')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::https://git.krzak.org/N0VA/kewt/releases/download/v${pkgver}/kewt")
sha256sums=('d734b2d70d36ff933ff7c92948ab247e69b726059c854bf1fc5e0cba7be7e695')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kewt" --dump-zsh-completions > "${pkgdir}/usr/share/zsh/site-functions/_kewt"
}
