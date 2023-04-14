# Contributor: asuka minato
# Contributor: Hanabishi
_name=esbuild
pkgname=${_name}-bin
pkgver=0.17.15
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://${_name}.github.io"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
source=(LICENSE.md::https://raw.githubusercontent.com/evanw/esbuild/23c40b1b6a76a8626f1d160f89677ed2c73b6090/LICENSE.md)
_get_source() {
    local npmpkg="linux-$1"
    local archive="${npmpkg}-${pkgver}.tgz"
    echo "${_name}-${archive}::https://registry.npmjs.org/@${_name}/${npmpkg}/-/${archive}"
}
sha256sums=('b40ec5baec7bb34fa5b1c09521fa3cd52d5fad7adafed74932a2010d3612a681')
sha256sums_x86_64=('e3f114eaa4e1fc80ce67c91741985e62f7fc1ab4f892184f40d4df134f3f538c')
sha256sums_i686=('b67183b72070d83e14e9d5c29eeca766f7e49b1ed31fd9a0f2bd3165914ef127')
sha256sums_aarch64=('18fa9758c43983ccff7810efe653f97a1331c40ee174795e25af7675f58a4ebc')
sha256sums_armv7h=('7b8e712f3c466e69d8933f5974bd1bf270aed7c8220a1fc43e327c0527d45c26')
source_x86_64=("$(_get_source x64)")
source_i686=("$(_get_source ia32)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source arm)")


package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
    install -Dm644 LICEN* -t $pkgdir/usr/share/licenses/$pkgname/
}
