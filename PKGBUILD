# Maintaoner: Yamada Hayao <development@fascode.net>

pkgname="wfa-git"
pkgver=r35.8a659ce
pkgrel=1
pkgdesc="A simple AUR helper written in a shell script"
arch=('any')
url="https://github.com/Hayao0819/wfa"
license=('WTFPL')
depends=('sudo' 'pacman' 'jq' 'python3' 'curl' 'pyalpm')
makedepends=('git')
source=("git+https://github.com/Hayao0819/wfa")
md5sums=('SKIP')

pkgver() {
  cd "wfa"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        install -m 755 -D "${srcdir}/wfa/wfa" "${pkgdir}/usr/bin/wfa"
        install -m 755 -D "${srcdir}/wfa/LICENSE" "${pkgdir}/usr/share/licenses/wfa/LICENSE"
        install -m 755 -D "${srcdir}/wfa/README.md" "${pkgdir}/usr/share/licenses/wfa/README.md"
}
