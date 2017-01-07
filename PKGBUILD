# Contributor: Sherlock-Holo <sherlockya@gmail.com>
# Contributor: Sherlock-Holo <sherlockya@gmail.com>

pkgname=pvim
pkgver=v0.2
pkgrel=1
pkgdesc="a script helps you quickly upload the code to cfp-vim"
url="https://github.com/Sherlock-Holo/pvim"
arch=('any')
license=('MPL')
depends=('xclip')
makedpends=('git')
source=("git://github.com/Sherlock-Holo/$pkgname.git")
md5sums=('SKIP')

pkgver(){
        cd "${_pkgname}"
        # Use un-annotated tags to derive a version number
        git describe --always --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package(){
        cd "${pkgname}"

        # Install
        install -Dm755 $pkgname.sh "${pkgdir}/usr/bin/${pkgname}"
}
