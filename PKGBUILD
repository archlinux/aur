pkgname=gitlist
pkgver=0.5.0
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
source=(https://s3.amazonaws.com/gitlist/gitlist-$pkgver.tar.gz)
sha1sums=('eeda77db8f769f0480577d33b600982aeba5bdbc')

package() {
    local dstdir="$pkgdir"/usr/share/webapps
    install -d "$dstdir"
    cp -a "$srcdir"/gitlist "$dstdir"/gitlist
    mkdir "$dstdir"/gitlist/cache
    chmod 777 "$dstdir"/gitlist/cache
    install -Dm644 gitlist/LICENSE.txt "$pkgdir"/usr/share/licenses/gitlist/LICENSE
}

