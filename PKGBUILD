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
sha512sums=('78bd7ba96002e47515a577e3ca66a3722021ada0e83c4ccdcc1ef6a037f19515d34260bb9d3c32e343c3f262b3230339018fc8bb44492dc5b8531d3b879c0f46')

package() {
  cd "${srcdir}/pass-ssh-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
