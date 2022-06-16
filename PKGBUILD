# Maintainer: Yamada Hayao <development@fascode.net>
# Contributor: Abraham Levine <echo iue@trnspljc.890 | tr ietursnpl890jc acprlsurecomed>

_gitname='aptpac'
pkgname="aptpac"
pkgdesc="a pacman wrapper with syntax from debian's apt"
pkgver="3.3.0"
pkgrel="1"

arch=('any')
url="https://github.com/FascodeNet/aptpac"
license=('WTFPL')
conflicts=('apt' 'apt-git' 'aptpac-git')

source=("${url}/archive/v${pkgver}.zip")
md5sums=('SKIP')

package() {
    cd "${_gitname}-${pkgver}"
    install -m 755 -D aptpac "${pkgdir}/usr/bin/aptpac"
    install -m 755 -D LICENSE "${pkgdir}/usr/share/licenses/aptpac/LICENSE"
    cd "${pkgdir}/usr/bin/"
    ln -s "aptpac" "apt"
    ln -s "aptpac" "apt-get"
}
