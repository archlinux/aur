pkgname=esbuild-bin
pkgver=0.15.16
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://esbuild.github.io"
license=('MIT')

_name="${pkgname%-*}"
provides=("${_name}")
conflicts=("${_name}")

_get_source() {
    local npmpkg="${_name}-linux-$1"
    local archive="${npmpkg}-${pkgver}.tgz"
    echo "${archive}::https://registry.npmjs.org/${npmpkg}/-/${archive}"
}

source_x86_64=("$(_get_source 64)")
source_i686=("$(_get_source 32)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source arm)")

sha256sums_x86_64=('f3a17b05ebaac0654265d43ff14d86265b79e82981abcc1c2bf952b7288081d1')
sha256sums_i686=('540449c1dcff7cc6c7135bf4f41092627731b4d4770fd1c44f11b97cd8b76c22')
sha256sums_aarch64=('79db53b0f21eafca2fd4a397c271498904e1dee0dfcc607097d878b463e2a547')
sha256sums_armv7h=('65f58cd96a05efad87af63bad41c62af14ccb3019ca4596bb5204b6adb513425')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
}
