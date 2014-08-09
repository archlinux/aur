# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=epymc
_pkgver=1.0.0-beta1
pkgver=1.0.0beta1
pkgrel=1
pkgdesc="Media Center based on EFL"
arch=('any')
url="https://github.com/DaveMDS/epymc"
license=('GPL3')
depends=('python2-efl')
optdepends=('lirc: remote contol support'
            'mutagen: Music module'
            'python2-beautifulsoup4: Online Channels module'
            'sdlmame: MAME module')
source=("https://github.com/DaveMDS/$pkgname/archive/v$_pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver"

  find -name "*.py" -exec sed -i 's/env python$/&2/' {} \;
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
}
