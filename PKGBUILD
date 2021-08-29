# Maintainer: jnanar <info@agayon.be>

pkgname='python-urwid-satext-hg'
_realname=urwid_satext
_hgname=urwid-satext
pkgver=.r146.4d6a29358f32
pkgrel=1
pkgdesc="Urwid satext is a curses-based user interface library for sat (salut à toi)."
license=('LGPL3+')
arch=('any')
depends=('python-urwid' 'python')
provides=('python-urwid-satext')
replaces=('python2-python-urwid-satext' 'python-urwid-satext')
url="https://www.goffi.org/"
source=("hg+https://repos.goffi.org/urwid-satext")
sha512sums=('SKIP')
#options=('!strip')

pkgver() {
    cd "$_hgname"
    printf "$_version.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/${_hgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

