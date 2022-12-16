# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Alfred Roos alfred@stensatter.se
pkgname=linecounter-git
pkgver=1.2.1
pkgrel=1
epoch=
pkgdesc="This is a program that can count all lines in your source code. Run lctr -lf to count all lines. Run lctr for help!"
arch=(x86_64)
url="https://github.com/spynetS/Linecounter.git"
license=('MIT')
groups=()
depends=()
makedepends=(git python python-pip)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

pkgver(){
    cd "${_pkgname}"
    printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd ..
    git clone https://github.com/spynetS/Linecounter.git lctr
    cd lctr
    pwd
    ls
    chmod 755 ./build.sh
    exec ./build.sh
}
