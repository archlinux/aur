# Maintainer: emi~ <emi@pokemod.dev>

pkgname=grc-devel-git
_pkgname=grc
pkgver=1.11.3.r81.g8263f4f
pkgrel=1
pkgdesc="Yet another colouriser for beautifying your logfiles or output of commands. Devel branch."
arch=('any')
url='https://github.com/garabik/grc'
license=('GPL')
depends=('python')
makedepends=('git')
provides=('grc')
conflicts=('grc')
backup=('etc/grc.conf')
source=("$pkgname::git+$url.git#branch=devel")
md5sums=('SKIP')
sha256sums=('SKIP')


pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    ./install.sh "$pkgdir"/usr "$pkgdir"
}
