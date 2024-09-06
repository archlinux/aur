# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>

_pkgname="vivify"
pkgname="vivify-bin"
provides=("vivify")
conflicts=("vivify")
pkgver="0.6.0"
pkgrel=1
pkgdesc="Markdown preview tool which can be used standalone or plug into an editor like (Neo)Vim"
arch=("x86_64")
url="https://github.com/jannis-baum/vivify"
license=("GPL-3.0-or-later")
depends=("gcc-libs" "sh")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jannis-baum/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux.tar.gz")
sha256sums=("ff6f69388c2b31770ddbcb06cc1e70d3927d2ee5d9058db0aaf78305875c3269")

# Stripping 'unneeded symbols' causes vivify-server executable to break
# (segmentation fault)
options=(!strip)

package() {
	cd ./vivify-linux
        install -Dm755 ./viv           "${pkgdir}/usr/bin/viv"
        install -Dm755 ./vivify-server "${pkgdir}/usr/bin/vivify-server"
}
