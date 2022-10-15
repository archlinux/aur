# Maintainer: billypilgrim <billypilgrim@gmx.co.uk>
pkgname=git-hub
pkgver=2.1.3
pkgrel=1
pkgdesc="Git command line interface to GitHub"
arch=('any')
url="https://github.com/sociomantic-tsunami/git-hub"
license=('GPLv3')
depends=('python' 'git' 'bash-completion')
makedepends=('python-docutils')

source=(
    "git+https://github.com/sociomantic-tsunami/git-hub.git#tag=v$pkgver"
)

sha1sums=('SKIP')

build ()
{
    cd $pkgname
    make all
}

package ()
{
    cd $srcdir/$pkgname
    make DESTDIR=$pkgdir prefix=/usr install
}
