# Maintainer: Pandada8 < pandada8@gmail.com >


pkgname=inotify-info-git
_repo_name=inotify-info
pkgver=r26.5710dd1
pkgrel=1
pkgdesc='Linux inotify info reporting app'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/mikesart/inotify-info'
license=('MIT')
source=("git+${url}.git")
md5sums=(SKIP)

build() {
  cd ${srcdir}/$_repo_name
  make
}

pkgver() {
  cd ${srcdir}/$_repo_name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/$_repo_name
  install _release/inotify-info -Dm755 ${pkgdir}/usr/bin/inotify-info
}

