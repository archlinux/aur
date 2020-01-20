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
sha512sums=('72c7492502a0e6ef3710e08bc13a2925d2ca0fe5f1efe5ba5ab4ac3bbe4fd556ef725391f0f575e290b01b88ed0e53697060f5694fc5430cb527ec0a59220f98')

package() {
  cd "${srcdir}/pass-ssh-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
