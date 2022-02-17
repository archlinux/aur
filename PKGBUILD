# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
# shellcheck disable=all

pkgname=shellfetch
pkgver=2022.02.17
pkgrel=1
pkgdesc="Shell System Information Fetcher"
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/$pkgname"
license=('MIT')
depends=('bash' 'xorg-xrandr' 'figlet')
makedepends=('git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('a7484f8f89f7082557ac45091745d3d0d47ce667ff848f2561727bd671f7b8da')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
