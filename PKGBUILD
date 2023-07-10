# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="cpeditor-bin"
pkgver=6.10.3
pkgrel=1
pkgdesc="The IDE for competitive programming Fetch, Code, Compile, Run, Check, Submit"
arch=("x86_64")
url="https://cpeditor.org/"
_githuburl="https://github.com/cpeditor/cpeditor"
license=("GPL3")
depends=('xcb-util-image' 'qt5-base' 'libxkbcommon-x11' 'xcb-util-wm' 'qt5-svg' 'xcb-util' 'xcb-util-keysyms' 'xcb-util-renderutil' 'libxext' \
    'zlib' 'libgpg-error' 'freetype2' 'glibc' 'libx11' 'e2fsprogs' 'bash' 'fontconfig' 'libxkbcommon' 'libglvnd' 'gcc-libs' 'libxcb')
optdepends=(
    'cf-tool: submit to Codeforces'
    'clang: C++ format and language server'
    'java-environment: compile Java'
    'java-runtime: execute Java'
    'python: execute Python'
    'wakatime: track coding stats'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.deb")
sha256sums=('47ce8cd065753557d04270dcd32d2bc8b737e3ce8a9a48e59017c0e0f4786a33')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}