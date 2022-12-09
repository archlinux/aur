# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Alfred Roos <alfred@stensatter.se>
pkgname=Calcer-git
pkgver=2
pkgrel=2
epoch=
pkgdesc="Java based terminal calculator"
arch=(x86_64)
url="https://github.com/spynetS/Calcer"
license=('MIT')
groups=()
depends=("git" )
makedepends=("jre-openjdk")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
    sudo rm -f /usr/bin/JCalc.jar
    sudo rm -f /usr/bin/calcer
    git clone $url calcergit
    git clone https://github.com/spynetS/JCalc
}


package() {
    
    sudo mv ./JCalc/out/artifacts/JCalc_jar/JCalc.jar /usr/bin/JCalc.jar
    sudo mv ./calcergit/calcer /usr/bin/calcer

}
