# Maintainer: Jessee Chan <CYPHER0@foxmail.com>


_reponame="misty.fcitx5"
pkgname="fcitx5-misty-theme"
pkgver=r6.af6da74
pkgrel=1
pkgdesc="Misty colorful theme for fcitx5"
arch=('any')
url="https://github.com/ovwxxwvo/${_reponame}"
license=('MIT')
makedepends=('git')
source=("${_reponame}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  }

package() {
  # echo pkgname  $pkgname
  # echo reponame $_reponame
  cd ${_reponame}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755   "${pkgdir}/usr/share/fcitx5/themes/"
  cp -r  ./misty*  "${pkgdir}/usr/share/fcitx5/themes/"
  }


