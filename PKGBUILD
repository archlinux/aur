# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=pacolog
pkgver=2.1.0
pkgrel=2
pkgdesc='List recent commits for Arch Linux packages'
url='https://gitlab.com/protist/pacolog'
arch=('any')
license=('GPL3')
depends=('w3m')

source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('a48f04de8b24d7c0a2e05ad22059e0793fc70b4bd4620e72d7e125ea6ed514a3')

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 completion/bash "${pkgdir}/etc/bash_completion.d/pacolog"
  install -Dm644 completion/zsh "${pkgdir}/usr/share/zsh/site-functions/_pacolog"
}
