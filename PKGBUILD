# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.6.5
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://kewt.krzak.org"
license=('ISC')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::https://git.krzak.org/N0VA/kewt/releases/download/v${pkgver}/kewt")
sha256sums=('70e6850fbf555f37a812a0a819908cd5af36f435cd8988d67a7d6e80e79fd4bc')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kewt" --dump-zsh-completions > "${pkgdir}/usr/share/zsh/site-functions/_kewt"
}
