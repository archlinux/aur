# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

_pkgname=apkdiff
pkgname=apkdiff-git
pkgver=r22.c48e32d
pkgrel=1
pkgdesc="Diff between two APK files."
arch=("any")
url="https://github.com/daniellockyer/${_pkgname}"
license=("Unlicense")
depends=("python" "android-apktool")
optdepends=("meld: required for the -m flag")
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_git_folder="${_pkgname}"
source=("${_git_folder}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_git_folder}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${_git_folder}"
  install -Dm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
}
