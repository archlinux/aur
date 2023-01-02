# Prev. Maintainer: Pavel Horniak <gouster4@gmail.com>
# Maintainer: Takumi <dGFrdW9oQHR1dGEuaW8K | base64 -d>
pkgname=newflasher-git
_pkgname=newflasher
pkgver=194
pkgrel=1
pkgdesc='This experimental software allows you to flash firmwares acquired through XperiFirm to Sony phones including and newer than the XZ Premium.'
arch=('x86_64')
license=('MIT')
url="https://forum.xda-developers.com/crossdevice-dev/sony/progress-newflasher-xperia-command-line-t3619426"
depends=('zlib' 'expat')
makedepends=('git')
source=(git+https://github.com/newflasher/newflasher)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

build() {
    cd "$srcdir"/${_pkgname}
    make
}

package(){
  # Moving everything to pkg/.
  cd "$srcdir"/${_pkgname}
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
