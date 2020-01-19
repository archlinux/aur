# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgname=mopidy-headless-git
_gitname=mopidy-headless
pkgver=0.0.1
pkgrel=2
pkgdesc="Mopidy extension for controlling Mopidy using generic input devices"
arch=('any')
url="https://github.com/avanc/mopidy-headless"
license=('APACHE')
depends=('python' 'python-evdev' 'mopidy>=3.0')
makedepends=('python' 'git')
conflicts=('mopidy-headless')
provides=('mopidy-headless')
source=("git+https://github.com/avanc/mopidy-headless")
md5sums=('SKIP')

package() {
  cd "$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
