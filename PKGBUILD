# Maintainer: iris snazzsinclair@gmail.com
pkgname=ftconall-git
_pkgname=ftconall
pkgver=0.2.0.r1.g8622bd7
pkgrel=1
pkgdesc="A new way to program for FTC on any IDE and any OS"
arch=('any')
url="https://github.com/Iris-TheRaibow/FTCOnAll"
license=('BSD3')
makedepends=(
			'git'
            'pyinstaller'
            'python>=3.7'
)
source=("$_pkgname::git+https://github.com/Iris-TheRainbow/FTCOnAll.git")
b2sums=('SKIP')
pkgver(){
    cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build(){
    cd $_pkgname
    pyinstaller __main__.spec
}
package(){
    cd $_pkgname
    cd dist
    cp __main__ ftc
    install -Dm755 -t "${pkgdir}/usr/bin" ftc
}
