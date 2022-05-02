# Mainained by imper <imperator999mcpe@gmail.com>
pkgname="privacy-protection-messenger_imper"
pacname="privacy-protection-messenger"
pkgver=1.2
pkgrel=3
pkgdesc="Secure messenger backend"
author="imperzer0"
branch="imper"
url="https://github.com/$author/$pacname"
arch=('x86_64')
license=('GPL3')
depends=("openssl" "iptables-nft" "themispp>=0.14.1" "mariadb")
makedepends=("cmake>=3.0" "curl" "inet-comm>=3.8-1" "openssl" "themispp" "mariadb" "mariadb-connector-cpp-git")
checkdepends=()
optdepends=()
provides=()
conflicts=("privacy-protection-messenger")
replaces=()
backup=()
options=()
install=
changelog=

_srcprefix="https://raw.githubusercontent.com/$author/$pacname/$branch"
_libfiles=("CMakeLists.txt" "main.cpp" "color.hpp" "messenger.hpp" "constants.hpp" "$pacname.service")

for _libfile in ${_libfiles[@]}
{
    source=(${source[@]} "$_srcprefix/$_libfile")
}

md5sums=('a7abc0672242dedcd5e4f563456e7dbc'
         'a2dba69f4367abe24cd54ba931c693bd'
         '058646ab78672c97a2f18dffc1b56ebf'
         '5870cc285cd690761cd23c994737fa54'
         'd17f4a822e966a71ea10bac39429811d'
         'cc8e63452b809611b046e7f27934c12e')

_package_version=$pacname" ("$pkgver"-"$pkgrel")"
_var_directory="/var/lib/$pacname"

prepare()
{
    curl -L "$_srcprefix/PKGBUILD" > PKGBUILD-git
    ln -sf "$pacname-$pkgver-$pkgrel-$arch.pkg.tar.zst" "../$pkgname-$pkgver-$pkgrel-$arch.pkg.tar.zst"
}

build()
{
    . PKGBUILD-git && build
}

package()
{
    . PKGBUILD-git && package
}