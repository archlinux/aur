# Maintainer: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

pkgname=i3lock-wrapper
_gitname=i3-extras
pkgver=2015.04.28.g93a888c
pkgrel=2
pkgdesc='A simple wrapper around i3lock which blurs the current desktop'
arch=('any')
url='https://github.com/ashinkarov/i3-extras/'
license=('ISC')
groups=('i3')
depends=('i3lock' 'scrot' 'imagemagick')
makedepends=('git')
optdepends=('bc: for using the -l option'
            'ghostscript: for using the -l option')
source=("git+https://github.com/ashinkarov/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
