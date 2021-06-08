# Maintainer: 咸粽子 <xianzongzi aliyun.com>
pkgname=harmonyos-sans-git
_pkgname=harmonyos-sans
pkgver=r2.58f1bfa
pkgrel=1
pkgdesc="鸿蒙黑体, HarmonyOS fonts"
arch=('any')
url="https://gitee.com/openharmony/resources"
license=('custom')
groups=()
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  install -d "$pkgdir/usr/share/fonts/$_pkgname"
  install -m644 fonts/*.ttf "$pkgdir/usr/share/fonts/$_pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
