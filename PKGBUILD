# Maintainer: Jojii <jojii@gmx.net>
pkgname=datamanager-cli-git
pkgver=1.2.r213.cbc4727
pkgrel=1
epoch=
pkgdesc="The official cli client for the datamanager system"
arch=('i686' 'x86_64')
url="https://github.com/DataManager-Go/DataManagerCLI"
license=('MIT')
groups=()
depends=()
makedepends=(
    'git'
    'go'
)

options=()
install=
changelog=
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/DataManagerCLI"
	printf "1.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/DataManagerCLI"
	go build -o manager
}

package() {
	cd "$srcdir/DataManagerCLI"
        mkdir -p $pkgdir/usr/bin
        install -DT manager $pkgdir/usr/bin/manager

        echo
        tput bold
        echo -e "------------------ \e[5m\e[1mNote\e[0m --------------------------"
        echo -e "\e[0m"

        echo
        echo
        echo -e "---> \e[4m\e[1mBuild successful!!\e[0m"
        echo 
        echo "---> After installing issue 'manager setup <yourServerIP>' to connect to your datamanager server!"
        echo
        echo

        tput bold
        echo "---------------------------------------------"
        echo -e "\e[0m"
}
