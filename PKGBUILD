# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Maintainer: Chrys <chrys@linux-a11y.org>

_gitname='dragonfm'
pkgname="${_gitname}-git"
pkgver=r659.d0505a6
pkgrel=1
epoch=1
pkgdesc='A screenreader optimized, flexible command line filemanager'
arch=('any')
url="https://www.patreon.com/posts/64904217"
license=('LGPL')
depends=('ncurses' 'python-inotify-simple' 'python' 'python-sh')
optdepends=('atool: compression support'
  'mutt: send as e-mail support'
  'mpv: audio und video support for TTY'
  'w3m: HTML support'
  'xdg-utils: xdg-open support'
  'magic-wormhole: wormhole support')
makedepends=('git' 'python-setuptools')
backup=('etc/dragonfm/settings/settings.conf')
source=("git+https://github.com/chrys87/${_gitname}.git")
md5sums=('SKIP')

pkgver()
{
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "$srcdir/$_gitname"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
}

# vim: set ts=2 sw=2 et: 
