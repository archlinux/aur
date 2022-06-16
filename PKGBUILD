# Maintainer: Yamada Hayao <development@fascode.net>
# Contributor: Abraham Levine <echo iue@trnspljc.890 | tr ietursnpl890jc acprlsurecomed>

_gitname='aptpac'
pkgname="${_gitname}-git"
pkgdesc="a pacman wrapper with syntax from debian's apt"
pkgver=112.b67b9ec
pkgrel=1

arch=('any')
url="https://github.com/FascodeNet/aptpac"
license=('WTFPL')
makedepends=('git')
conflicts=('apt' 'apt-git' 'aptpac')

source=('git+https://github.com/FascodeNet/aptpac.git')
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    printf '%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_gitname}"
    install -m 755 -D aptpac "${pkgdir}/usr/bin/aptpac"
    install -m 755 -D LICENSE "${pkgdir}/usr/share/licenses/aptpac/LICENSE"
    cd "${pkgdir}/usr/bin/"
    ln -s "aptpac" "apt"
    ln -s "aptpac" "apt-get"
}
