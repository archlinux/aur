# Maintaoner: Yamada Hayao <development@fascode.net>
# Maintainer: Abraham Levine <echo iue@trnspljc.890 | tr ietursnpl890jc acprlsurecomed>

pkgname=aptpac-git
pkgver=2.0.0
pkgrel=1
pkgdesc="a pacman wrapper with syntax from debian's apt"
arch=('i686' 'x86_64')
url="https://github.com/Hayao0819/aptpac"
license=('WTFPL')
depends=('sudo')
makedepends=('git')
source=('git://github.com/Hayao0819/aptpac.git')
md5sums=('SKIP')
_gitname='aptpac'
conflicts=('apt' 'apt-git')

pkgver() {
        cd "${_gitname}" &&
        printf '%s.%s\n' "$(git rev-list --count HEAD)" \
                         "$(git rev-parse --short HEAD)"
}

package() {
        cd "${_gitname}" &&
        install -m 755 -D aptpac "${pkgdir}/usr/bin/aptpac"
        ln -s "${pkgdir}/usr/bin/aptpac" "${pkgdir}/usr/bin/apt"
        ln -s "${pkgdir}/usr/bin/aptpac" "${pkgdir}/usr/bin/apt-get"
}
