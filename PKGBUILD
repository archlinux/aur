# Maintainer: Onur Alp Akin <onralpakin@gmail.com>
# https://github.com/otuva/PKGBUILDs

pkgname=wayback-spn-script-git
_pkgname=wayback-machine-spn-scripts
pkgver=r94.af5f384
pkgrel=1
pkgdesc="a Bash script that asks the Internet Archive Wayback Machine's Save Page Now (SPN) to save live web pages"
arch=('x86_64' 'i686')
url="https://github.com/overcast07/wayback-machine-spn-scripts"
license=('MIT')
makedepends=('git')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$_pkgname"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm 755 spn.sh "${pkgdir}/usr/bin/spn"
}
