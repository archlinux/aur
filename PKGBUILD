# Maintainer: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>
_gitname=morituri-eaclogger
_gituser=JoeLametta
pkgname=whipper-eaclogger-git
pkgver=31.b0a5fd2
pkgrel=1
pkgdesc='whipper logger meant to mimic EAC style logs'
arch=('any')
url="https://github.com/${_gituser}/${_gitname}"
license=('GPL3')
depends=('morituri' 'python2')
makedepends=('git' 'python2-setuptools')
provides=('morituri-whatcd')
source=("git+https://github.com/${_gituser}/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
