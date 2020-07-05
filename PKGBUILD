# Maintaoner: Yamada Hayao <development@fascode.net>
# Maintainer: Abraham Levine <echo iue@trnspljc.890 | tr ietursnpl890jc acprlsurecomed>

pkgname=aptpac-git
pkgver=34.3b8b5ef
pkgrel=1
pkgdesc="a pacman wrapper with syntax from debian's apt"
arch=('any')
url="https://github.com/FascodeNet/aptpac"
license=('WTFPL')
depends=('sudo')
makedepends=('git')
source=('git://github.com/FascodeNet/aptpac.git')
md5sums=('SKIP')
_gitname='aptpac'
conflicts=('apt' 'apt-git' 'aptpac')

pkgver() {
        cd "${_gitname}" &&
        printf '%s.%s\n' "$(git rev-list --count HEAD)" \
                         "$(git rev-parse --short HEAD)"
}

package() {
        cd "${_gitname}" &&
        install -m 755 -D aptpac "${pkgdir}/usr/bin/aptpac"
        cd "${pkgdir}/usr/bin/"
        ln -s "aptpac" "apt"
        ln -s "aptpac" "apt-get"
}
