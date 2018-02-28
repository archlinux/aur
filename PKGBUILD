# Maintainer: iboyperson <iboyperson@gmail.com>

pkgname=osx-arc-aurorae-theme-git
reponame=OSX-Arc-Aurorae
pkgver=1.0.0.r0.g0b376e3
pkgrel=1
pkgdesc="An Aurorae theme designed to compliment @LinxGem33's OSX-Arc gtk themes"
arch=('x86_64')
url="https://github.com/iboyperson/OSX-Arc-Aurorae"
license=('GPL 3.0')
depends=('kwin')
provides=("osx-arc-aurorae-theme")
conflicts=("osx-arc-aurorae-theme")
source=("git+https://github.com/iboyperson/OSX-Arc-Aurorae.git")
sha256sums=('SKIP')

pkgver() {
  cd "$reponame"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
    mkdir -p "$pkgdir/usr/share/aurorae/themes"
    cp -r "${srcdir}/${reponame}/OSX-Arc" "${pkgdir}/usr/share/aurorae/themes/"
    cp -r "${srcdir}/${reponame}/OSX-Arc-Dark" "${pkgdir}/usr/share/aurorae/themes/"
}
