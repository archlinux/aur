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
sha512sums=('69b8758c296bba7f865f7a5faa81c83169c81eb4c6bc0356a53cde32b6f216726f87ad05b15152528529f37d88da2c8cddb102a9cc9f18e20952f0f61862c503')

package() {
  cd "${srcdir}/pass-ssh-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
