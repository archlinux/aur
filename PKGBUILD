# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=pacolog
pkgver=1.2.0
pkgrel=2
pkgdesc='List recent commits for Arch Linux packages'
url='https://gitlab.com/protist/pacolog'
arch=('any')
license=('GPL3')
depends=('w3m')
conflicts=('paclog')

source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('555eb46914a7ff5bf74e6a9c1939a3adcfe3dc9008c1aab56f5265077d0298de')

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 completion/bash "${pkgdir}/etc/bash_completion.d/pacolog"
  install -Dm644 completion/zsh "${pkgdir}/usr/share/zsh/site-functions/_pacolog"
}
