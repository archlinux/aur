# Maintainer: Anton Yermalovich <anton dot yermalovich at gmail dot com>
# Contributor: Stian Østerhaug <stian.osterhaug@gmail.com>

pkgname=dotfiles
pkgver=0.6.4
pkgrel=2
pkgdesc="A tool to make managing your dotfile symlinks in \$HOME easy, allowing you to keep all of them in a single directory."
license=('ISC')
arch=(any)
depends=('python'
         'python-setuptools')
url=https://github.com/jbernard/dotfiles
source=(https://pypi.python.org/packages/source/d/dotfiles/dotfiles-$pkgver.tar.gz)
md5sums=('6bdf65ce6fe4d7fd7b48091ede656679')

build() {
    cd "$srcdir/dotfiles-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/dotfiles-$pkgver"
    python setup.py install --root=$pkgdir
}

