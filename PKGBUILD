# Maintainer: Jessee Chan <CYPHER0@foxmail.com>


_reponame="misty.fcitx5"
pkgname="fcitx5-misty-theme"
pkgver=r5.25cea58
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
  pwd
  echo pkgname  $pkgname
  echo reponame $_reponame
  # ln -sf  ./${_reponame}/misty            ./
  # ln -sf  ./${_reponame}/misty-blueberry  ./
  # ln -sf  ./${_reponame}/misty-carambola  ./
  # ln -sf  ./${_reponame}/misty-grape      ./
  # ln -sf  ./${_reponame}/misty-lemon      ./
  # ln -sf  ./${_reponame}/misty-orange     ./
  # ln -sf  ./${_reponame}/misty-peach      ./
  # ln -sf  ./${_reponame}/misty-seagreen   ./
  # ln -sf  ./${_reponame}/misty-skyblue    ./
  cd ${_reponame}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm644   "${pkgdir}/usr/share/fcitx5/themes/"
  cp -r  ./misty*  "${pkgdir}/usr/share/fcitx5/themes/"
  }


