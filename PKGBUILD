# Contributor: Aerion <emile@aerion.co.uk>
# Contributor: TDY <tdy@archlinux.info>

# Debian uses the last commit as source, so it's good enough for the AUR
_commit=f33fbf3f08966c2845285305839dec6724429895

pkgname=ttf-beteckna
pkgver=0.5
pkgrel=1
pkgdesc="A geometric sans serif typeface inspired by the popular Futura"
arch=('any')
url="https://github.com/jeffmcneill/beteckna"
license=('GPL-3.0-or-later WITH Font-exception-2.0')
makedepends=('birdfont' 'git')
source=("git+${url}#commit=${_commit}")
sha256sums=('2669c0882c847754f57eda4ad76fa136e5734fb4e6dbd05f9e8ab941eac3b4fe')

build() {
  cd beteckna
  ./compile.sh
}

package() {
  cd beteckna
  install -Dm644 -t "${pkgdir}/usr/share/fonts/beteckna/" *.ttf geometric-sans/*.ttf
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md AUTHORS CHANGELOG
}

# vim:set ts=2 sw=2 et:
