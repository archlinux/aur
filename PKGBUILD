# Maintainer: maoyaotang <292898660@qq.com>

pkgname=ttf-honorsans
_pkgname=HONORSans
_pkgname1=HONORSansArabic
_pkgname2=HONORSansCN
_pkgname3=HONORSansTC
pkgver=1.2.r5.g98984fa
pkgrel=1
pkgdesc='华为HONORSans中文简繁字体添加nerd补丁    '
arch=('any')
url='https://developer.honor.com/cn/doc/guides/100681'
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
  install -dm 755 "${pkgdir}/usr/share/fonts/$_pkgname"
  cp -r ${srcdir}/$_pkgname/$_pkgname "${pkgdir}/usr/share/fonts/$_pkgname"
  cp -r ${srcdir}/$_pkgname/$_pkgname1 "${pkgdir}/usr/share/fonts/$_pkgname"
  cp -r ${srcdir}/$_pkgname/$_pkgname2 "${pkgdir}/usr/share/fonts/$_pkgname" #简体字去除前面加上# 
#  cp -r ${srcdir}/$_pkgname/$_pkgname3 "${pkgdir}/usr/share/fonts/$_pkgname" #繁体字把#去除
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
