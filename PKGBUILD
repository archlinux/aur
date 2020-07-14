pkgname=gitlist
pkgver=1.0.2
pkgrel=1
pkgdesc="An elegant and modern git repository viewer."
arch=('any')
url="http://gitlist.org/"
license=('BSD')

depends=('git' 'php')
optdepends=('apache: Web server to run GitList'
            'lighttpd: Web server to run GitList'
            'nginx: Lightweight Web server to run GitList')

options=('emptydirs')
install=$pkgname.install
source=("https://github.com/klaussilveira/${pkgname}/releases/download/${pkgver}/gitlist-${pkgver}.tar.gz")
sha1sums=('96b770f43b03fa2b1428722b892407b14b51d987')

package() {
    local dstdir="${pkgdir}"/usr/share/webapps
    install -d "${dstdir}"

    cp -a "${srcdir}/${pkgname}" "$dstdir"/gitlist
    mkdir "$dstdir"/gitlist/cache
    chmod 777 "$dstdir"/gitlist/cache
    install -Dm644 "${srcdir}/${pkgname}"/LICENSE.txt "$pkgdir"/usr/share/licenses/gitlist/LICENSE
}

