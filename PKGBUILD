# Maintainer: Sébastien Lemaire
_pkgname=nctelegram
_gitname=ncTelegram
pkgname=${_pkgname}-git
pkgver=0.9.6.r0.g1509f30
pkgrel=1
pkgdesc="A ncurse Telegram client developed in Python"
arch=('any')
url="https://github.com/Nanoseb/ncTelegram"
license=('GPL3')
depends=('python' 'python-urwid' 'python-psutil' 'pytg>=0.4.10')
makedepends=('git' 'python-distribute')
optdepends=(
'libnotify: library to display notifications'
'libcaca: library to display inline images'
'ttf-symbola: font for emoji'
)
conflicts=('nctelegram')
provides=('nctelegram')
source=("git+https://github.com/Nanoseb/ncTelegram.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_gitname"
	python setup.py install --root=${pkgdir}
}

