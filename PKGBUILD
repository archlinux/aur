# Mainained by imper <imperator999mcpe@gmail.com>
pkgname="privacy-protection-messenger"
pkgver=2.1
pkgrel=0
pkgdesc="Secure messenger backend"
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
arch=('x86_64')
license=('GPL3')
depends=("openssl" "iptables-nft" "themispp>=0.14.1" "mariadb" "lua")
makedepends=("cmake>=3.0" "inet-comm>=3.10-0" "openssl" "themispp" "mariadb" "mariadb-connector-cpp-git" "lua")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

_srcprefix="https://raw.githubusercontent.com/$author/$pkgname/$branch"
_libfiles=("CMakeLists.txt" "color.hpp" "config.lua" "constants.hpp" "main.cpp" "messenger.hpp" "$pkgname.service")

for _libfile in ${_libfiles[@]}
{
    source=(${source[@]} "$_srcprefix/$_libfile")
}

md5sums=('394719936ca96d2a7e28eb2d7da27b93'
         '058646ab78672c97a2f18dffc1b56ebf'
         '2935854d25c83b99ff259294c4f92971'
         '7b6219f801b85979015e2323815630d0'
         '462360fcefb35ac56a1041fca8aa81dc'
         '5e5dcc6abed6801a663a6949ff3fa55a'
         '48db5e5193c134ec52fef48b1d133c5e')

_package_version=$pkgname" ("$pkgver"-"$pkgrel")"
_var_directory="/var/lib/$pkgname"
_cfg_directory="/etc/$pkgname"

prepare()
{
    curl -L "$_srcprefix/PKGBUILD" > PKGBUILD-git
}

build()
{
    . PKGBUILD-git && build
}

package()
{
    . PKGBUILD-git && package
}