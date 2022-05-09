# Mainained by imper <imperator999mcpe@gmail.com>
pkgname="privacy-protection-messenger"
pkgver=1.3
pkgrel=2
pkgdesc="Secure messenger backend"
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
arch=('x86_64')
license=('GPL3')
depends=("openssl" "iptables-nft" "themispp>=0.14.1" "mariadb")
makedepends=("cmake>=3.0" "curl" "inet-comm>=3.9-0" "openssl" "themispp" "mariadb" "mariadb-connector-cpp-git")
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
_libfiles=("CMakeLists.txt" "color.hpp" "constants.hpp" "main.cpp" "messenger.hpp" "$pkgname.service")

for _libfile in ${_libfiles[@]}
{
    source=(${source[@]} "$_srcprefix/$_libfile")
}

md5sums=('a7abc0672242dedcd5e4f563456e7dbc'
         '058646ab78672c97a2f18dffc1b56ebf'
         'd17f4a822e966a71ea10bac39429811d'
         '2da9c648c0162c0a5f45f6d1f81e92b6'
         'fc085353cd83df9bcca751675006fd40'
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