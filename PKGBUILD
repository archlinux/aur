# Mainained by imper <imperator999mcpe@gmail.com>
pkgname="privacy-protection-messenger-qt"
pkgver=1.0
pkgrel=0
pkgdesc="Privacy Protection Messenger Qt GUI"
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
arch=('x86_64')
license=('GPL3')
depends=("qt6-base" "privacy-protection-messenger>=1.2-1")
makedepends=("cmake>=3.0" "qt6-base")
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
_languages=("uk_UA" "ru_UA" "ru_RU")
_libfiles=("CMakeLists.txt" "main.cpp" "mainwindow.cpp" "mainwindow.h" "call_backend.hpp"
          "mainwindow.ui" "resources.qrc")

for _lang in ${_languages[@]}
{
    _libfiles=(${_libfiles[@]} $pkgname"_"$_lang".ts")
}

for _libfile in ${_libfiles[@]}
{
    source=(${source[@]} "$_srcprefix/$_libfile")
}

md5sums=('208f4dc62ecd087db95961fc095f3f89'
         '19701c33c592f57e964d4a4d6e9c64f5'
         'f55347b6da2079d0867dd9074d85fa0a'
         '334adfb9460b7ce460160ca427f320b0'
         '4a11723938d5f540812b0f0b52b46ae7'
         'e3f9ff227d4727c384daad3bcd0fc0a9'
         'baff22f5e98a6c117c609b3078d4d373'
         '05cf19b4d413f0cfbefe3415b4d4e80f'
         '43ca58212a0ebb4d303b581844799928'
         '980681771058d0cc584f9fa154e5296b')

build()
{
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ .
	make
}

package()
{
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}