# Maintainer: xeruf <27f at pm dot me>

pkgbasename='pass-clip'
pkgname="${pkgbasename}-git"
pkgver=v0.2.r7.g9ef6e93
pkgrel=1
pkgdesc='A pass extension to copy passwords to the clipboard using fzf or rofi.'
arch=('any')
url='https://github.com/ibizaman/pass-clip'
license=('GPL3')
depends=('pass')
optdepends=('rofi: Use rofi to present choices.'
            'fzf: Use fzf to present choices.')
source=('git+https://github.com/ibizaman/pass-clip')
sha512sums=('SKIP')

package() {
  cd "${srcdir}/${pkgbasename}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}

pkgver() {
  cd "${pkgbasename}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
