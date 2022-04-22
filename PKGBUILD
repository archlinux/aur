# Mainained by imper <imperator999mcpe@gmail.com>
pkgname="privacy-protection-messenger"
pkgver=1.2
pkgrel=2
pkgdesc="Secure messenger backend"
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
arch=('x86_64')
license=('GPL3')
depends=("openssl" "iptables-nft" "themispp>=0.14.1" "mariadb")
makedepends=("cmake>=3.0" "curl" "inet-comm>=3.6-0" "openssl" "themispp" "mariadb" "mariadb-connector-cpp-git")
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
_libfiles=("CMakeLists.txt" "main.cpp" "color.hpp" "network.hpp" "$pkgname.service")

for _libfile in ${_libfiles[@]}
{
    source=(${source[@]} "$_srcprefix/$_libfile")
}

md5sums=('22e1b421db28f59f6827e4179ab39541'
         'a3b00d0b47d875eb4c00c1468cd36fd2'
         '058646ab78672c97a2f18dffc1b56ebf'
         '4b700bff185758024c5aeb0054b0e010'
         'cc8e63452b809611b046e7f27934c12e')

_package_version=$pkgname" ("$pkgver"-"$pkgrel")"
_var_directory="/var/lib/$pkgname"

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