# Mainained by imper <imperator999mcpe@gmail.com>
pkgname="privacy-protection-messenger"
pkgver=1.5
pkgrel=0
pkgdesc="Secure messenger backend"
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
arch=('x86_64')
license=('GPL3')
depends=("openssl" "iptables-nft" "themispp>=0.14.1" "mariadb" "lua>=5.3")
makedepends=("cmake>=3.0" "inet-comm>=3.9-0" "openssl" "themispp" "mariadb" "mariadb-connector-cpp-git" "lua>=5.3")
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
         '0acea4b2198c6e1c1f51b398bb2c7487'
         '7b6219f801b85979015e2323815630d0'
         'e00fc2264833b47f203e1d541277efd6'
         'a03f359a7866da55ff8520e07e9356e7'
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