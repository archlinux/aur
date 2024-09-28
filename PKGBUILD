# Maintainer: maoyaotang <292898660@qq.com>

pkgname=ttf-honorsans
_pkgname=HONORSans
pkgver=1.2.r2.gac5a212
pkgrel=1
pkgdesc='华为HONORSans中文字体添加nerd补丁'
arch=('any')
url='https://developer.honor.com/cn/'
license=('custom')
provides=('HONORSans')
source=("git+https://github.com/maoyaotang12/HONORSans.git")
sha256sums=('SKIP')
pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

package() {
  cd "${_pkgname}"
  install -dm 755 "${pkgdir}/usr/share/fonts/HONORSans"
  cp -r * "${pkgdir}/usr/share/fonts/HONORSans"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
