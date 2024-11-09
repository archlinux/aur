pkgname=xdg-ninja
pkgver=0.2.0.2
pkgrel=2
pkgdesc='A shell script which checks your $HOME for unwanted files and directories'
arch=('any')
url="https://github.com/b3nj5m1n/${pkgname}"
license=('MIT')
options=('!strip')

depends=('jq')
optdepends=('glow: for rendering markdown in the terminal')

_snapshot="${pkgname}-${pkgver}"
source=("${url}/archive/v${pkgver}/${_snapshot}.tar.gz")
sha256sums=('6adfe289821b6b5e3778130e0d1fd1851398e3bce51ddeed6c73e3eddcb806c6')

package() {
    cd "${_snapshot}"
    DESTDIR="${pkgdir}" PREFIX='/usr' make install
}
