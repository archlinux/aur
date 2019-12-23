# Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>

pkgname='pass-ssh'
pkgver=0.2
pkgrel=1
pkgdesc='A pass extension that creates ssh keys with an automatically generated passphrases stored in pass and outputs the public key using fzf or rofi'
arch=('any')
url='https://github.com/ibizaman/pass-ssh'
license=('GPL3')
depends=('pass')
optdepends=('rofi: Use rofi to present choices.'
            'fzf: Use fzf to present choices.')
source=(https://github.com/ibizaman/pass-ssh/archive/v${pkgver}.tar.gz)
sha512sums=('b50829a0d902f1cb9774f35afd2a82d20184247bbee42dc223b17609aa2f88b990a753e5602f538b10ce2b2bd26eac955a6884e66c4928a9881996485b9c81e8')

package() {
  cd "${srcdir}/pass-ssh-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
