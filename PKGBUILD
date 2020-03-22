# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="covid19-cli-git"
_pkgname="covid19-cli"
pkgver=0.1.6.r0.g0ea469c
pkgrel=2
pkgdesc="Corona Virus (Covid 19) BASH Tracking CLI"
arch=('any')
url="https://github.com/garrylachman/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('jq')
source=("${_pkgname}::git+https://github.com/garrylachman/${_pkgname}")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${_pkgname}"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
    
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
}
 
 
