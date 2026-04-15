# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>

_pkgname="vivify"
pkgname="vivify-bin"
provides=("vivify")
conflicts=("vivify")
pkgver="0.14.0"
pkgrel=1
pkgdesc="Markdown preview tool which can be used standalone or plug into an editor like (Neo)Vim"
arch=("x86_64")
url="https://github.com/jannis-baum/vivify"
license=("GPL-3.0-or-later")
depends=("gcc-libs" "sh")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux.tar.gz")
sha256sums=("f88696eec6eb9f10a0ca7ac4a1803d5617e31b8b65b831f992108f983ed8b1b2")

# Stripping 'unneeded symbols' causes vivify-server executable to break
# (segmentation fault)
options=(!strip)

package() {
        cd ./vivify-linux
        install -Dm755 ./viv           "${pkgdir}/usr/bin/viv"
        install -Dm755 ./vivify-server "${pkgdir}/usr/bin/vivify-server"
}
